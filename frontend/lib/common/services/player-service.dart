import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swagger/api.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  Episode _episode;
  Image _episodeImage;
  Image _episodeThumbnail;
  String _episodeAudio;
  AudioPlayerState _audioPlayerState;

  PlayerService() {
    _initializeState();
    // Callback every time the audio progress changes (possible performance bottleneck).
    _audioPlayer.onAudioPositionChanged.listen((position) {
      _episode.position = position;
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

  void _initializeState() {
    _episode = Episode(
        "No currently playing episode.",
        "",
        // TODO: Figure image
        "",
        Duration(seconds: 0),
        Duration(seconds: 0),
        "Unavailable",
        "",
        "",
        DateTime.now()
    );
    _episodeImage = Image.asset('assets/no-podcast.png');
    _episodeThumbnail = Image.asset('assets/no-podcast.png');
    _audioPlayerState = AudioPlayerState.STOPPED;
    notifyListeners();
  }

  Episode get episode {
    return _episode;
  }


  Image get episodeImage {
    return _episodeImage;
  }

  Image get episodeThumbnail {
    return _episodeThumbnail;
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
            _audioPlayer.seek(episode.position);
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
    seek(episode.position + Duration(seconds: seconds));
  }

  void replay(int seconds) {
    seek(episode.position - Duration(seconds: seconds));
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
    _episodeImage = Image.network(episodeFull.image);
    _episodeThumbnail = Image.network(episodeFull.thumbnail);
    _episodeAudio = episodeFull.audio;
  }

  void play(Episode episode) {     _loadEpisodeData(episodeFull, 0);
      notifyListeners();
      _audioPlayer.play(episode.a).then((result) async {
        if (result == 1) {
          notifyListeners();
          await _persistPlayingEpisode(episode.id);
          await _persistResumePoint(0);
        }
      });
  }
}
