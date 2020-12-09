import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/common/services/played-episodes-service.dart';
import 'package:frontend/object-model/episode.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  PlayedEpisodesService playedEpisodesService;
  String _episodeTitle;
  String _episodeId;
  Image _episodeImage;
  Image _episodeThumbnail;
  String _episodePublisher;
  String _episodeAudio;
  Duration _episodeDuration;
  Duration _episodePosition;
  AudioPlayerState _audioPlayerState;

  PlayerService(this.playedEpisodesService) {
    _initializeState();
    // Callback every time the audio progress changes (possible performance bottleneck).
    _audioPlayer.onAudioPositionChanged.listen((position) {
      _episodePosition = position;
      int seconds = position.inSeconds;
      if (seconds % 20 == 0) {
        _persistResumePoint(seconds);
      }
      notifyListeners();
    });
    _audioPlayer.onPlayerStateChanged.listen((event) {
      _audioPlayerState = event;
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
    _episodeId = "";
    _episodeImage = Image.asset('assets/no-podcast.png');
    _episodeThumbnail = Image.asset('assets/no-podcast.png');
    _episodePublisher = "Unavailable";
    _episodeDuration = Duration(seconds: 0);
    _episodePosition = Duration(seconds: 0);
    _audioPlayerState = AudioPlayerState.STOPPED;
    notifyListeners();
  }

  String get episodeTitle {
    return _episodeTitle;
  }

  String get episodeId {
    return _episodeId;
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

  bool get isPlaying {
    return _audioPlayerState == AudioPlayerState.PLAYING;
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  // TODO: Play button verandert te vlug als ge pas hebt heropgestart. Is het zelfs niet trager dan de "start" button?
  void resume() {
    switch (_audioPlayerState) {
      case AudioPlayerState.STOPPED:
        _audioPlayer.play(_episodeAudio).then((result) {
          if (result == 1) {
            _audioPlayer.seek(_episodePosition);
          }
        });
        break;
      case AudioPlayerState.PLAYING:
        break;
      case AudioPlayerState.PAUSED:
        _audioPlayer.resume();
        break;
      case AudioPlayerState.COMPLETED:
        // TODO: Handle this case.
        break;
    }
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    _persistResumePoint(position.inSeconds);
  }

  void forward(int seconds) {
    seek(_episodePosition + Duration(seconds: seconds));
  }

  void replay(int seconds) {
    seek(_episodePosition - Duration(seconds: seconds));
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
    _episodeId = episodeFull.id;
    _episodeImage = Image.network(episodeFull.image);
    _episodeThumbnail = Image.network(episodeFull.thumbnail);
    _episodePublisher = episodeFull.podcast.publisher;
    _episodeAudio = episodeFull.audio;
    _episodeDuration = Duration(seconds: episodeFull.audioLengthSec);
    _episodePosition = Duration(seconds: resumePoint);
  }

  void play(String episodeId) {
    Episode playedEpisode = new Episode(_episodeTitle, _episodeId, "imageurltodo", _episodeDuration, _episodePosition, _episodePublisher, "idtodo", "descriptiontodo", DateTime.now());
    playedEpisodesService.insertPlayedEpisode(playedEpisode);

    Future<EpisodeFull> futureEpisodeFull = _api.getEpisode(episodeId);
    futureEpisodeFull.then((episodeFull) {
      _loadEpisodeData(episodeFull, 0);
      notifyListeners();
      _audioPlayer.play(episodeFull.audio).then((result) async {
        if (result == 1) {
          notifyListeners();
          await _persistPlayingEpisode(episodeId);
          await _persistResumePoint(0);
        }
      });
    });
  }
}
