import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  // TODO: Refactor naar bv episode data objecten?
  String _episodeTitle;
  Image _episodeImage;
  Image _episodeThumbnail;
  String _episodePublisher;
  String _episodeAudio;
  Duration _episodeDuration;
  Duration _episodePosition;
  bool _isPlayingAudio;
  bool _loadedEpisodeAudio;
  bool _loadedEpisodeData;

  PlayerService() {
    _initializeState();
    // Callback every time the audio progress changes (possible performance bottleneck).
    _audioPlayer.onAudioPositionChanged.listen((position) {
      _episodePosition = position;
      int seconds = position.inSeconds;
      if(seconds % 20 == 0) {
        _persistResumePoint(seconds);
      }
      notifyListeners();
    });
    _loadPersistedEpisode();
  }

  Future<void> _loadPersistedEpisode() async {
    final prefs = await SharedPreferences.getInstance();
    final episodeId = prefs.getString('episodeId') ?? "";
    final resumePoint = prefs.getInt('resumePoint') ?? 0;
    if (episodeId != "") {
      Future<EpisodeFull> futureEpisodeFull = _api.getEpisode(episodeId);
      futureEpisodeFull.then((episodeFull) {
        _loadEpisodeData(episodeFull, resumePoint);
        notifyListeners();
      });
    }
  }

  Future<void> _initializeState() async {
    _episodeTitle = "No currently playing episode.";
    _episodeImage = Image.asset('assets/no-podcast.png');
    _episodeThumbnail = Image.asset('assets/no-podcast.png');
    _episodePublisher = "Unavailable";
    _episodeDuration = Duration(seconds: 0);
    _episodePosition = Duration(seconds: 0);
    _isPlayingAudio = false;
    _loadedEpisodeData = false;
    _loadedEpisodeAudio = false;
    notifyListeners();
  }

  bool get isPlayingAudio {
    return _isPlayingAudio;
  }

  String get episodeTitle {
    return _episodeTitle;
  }

  Duration get episodeDuration {
    return _episodeDuration;
  }

  Duration get episodePosition {
    return _episodePosition;
  }

  Image get episodeImage {
    return _episodeImage;
  }

  Image get episodeThumbnail {
    return _episodeThumbnail;
  }

  String get episodePublisher {
    return _episodePublisher;
  }

  void pause() {
    _audioPlayer.pause();
    _isPlayingAudio = false;
    notifyListeners();
  }

  // TODO: Play button verandert te vlug als ge pas hebt heropgestart. Is het zelfs niet trager dan de "start" button?
  void resume() {
    if (_loadedEpisodeData) {
      if (_loadedEpisodeAudio) {
        _audioPlayer.resume();
      } else {
        _audioPlayer.play(_episodeAudio).then((result) {
              if (result == 1) {
                _loadedEpisodeAudio = true;
                _audioPlayer.seek(_episodePosition);
              }
            });
      }
      _isPlayingAudio = true;
      notifyListeners();
    }
  }

  void addAudioPlayerDurationListener(Function(Duration) listener) {
    _audioPlayer.onDurationChanged.listen(listener);
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    _persistResumePoint(position.inSeconds);
  }

  void forward(Duration duration) {
    seek(_episodePosition + duration);
  }

  void replay(Duration duration) {
    seek(_episodePosition - duration);
  }

  Future<void> _persistPlayingEpisode(String episodeId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("episodeId", episodeId);
  }

  Future<void> _persistResumePoint(int resumePoint) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("resumePoint", resumePoint);
  }

  void _loadEpisodeData(EpisodeFull episodeFull, int resumePoint) {
    _episodeTitle = episodeFull.title;
    _episodeImage = Image.network(episodeFull.image);
    _episodeThumbnail = Image.network(episodeFull.thumbnail);
    _episodePublisher = episodeFull.podcast.publisher;
    _episodeAudio = episodeFull.audio;
    _episodeDuration = Duration(seconds: episodeFull.audioLengthSec);
    _episodePosition = Duration(seconds: resumePoint);
    _loadedEpisodeData = true;
  }

  void play(String episodeId) {
    Future<EpisodeFull> futureEpisodeFull = _api.getEpisode(episodeId);
    futureEpisodeFull.then((episodeFull) {
        _loadEpisodeData(episodeFull, 0);
        notifyListeners();
        _audioPlayer.play(episodeFull.audio).then((result) async {
            if (result == 1) {
              _isPlayingAudio = true;
              notifyListeners();
              await _persistPlayingEpisode(episodeId);
              await _persistResumePoint(0);
            }
          });
        });
  }
}