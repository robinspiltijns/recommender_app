import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  String _episodeTitle;
  Image _episodeImage;
  Image _episodeThumbnail;
  String _episodePublisher;
  Duration _episodeDuration;
  Duration _episodePosition;
  bool _isPlayingAudio;
  bool _loadedPodcast;

  PlayerService() {
    _initializeState();
    _audioPlayer.onAudioPositionChanged.listen((position) {
      // Possible performance bottleneck.
      _episodePosition = position;
      notifyListeners();
    });
    _audioPlayer.onDurationChanged.listen((duration) {
      // Possible performance bottleneck.
      _episodeDuration = duration;
      notifyListeners();
    });
  }

  void _initializeState() {
    _episodeTitle = "No currently playing episode.";
    _episodeImage = Image.asset('assets/no-podcast.png');
    _episodeThumbnail = Image.asset('assets/no-podcast.png');
    _episodePublisher = "Unavailable";
    _episodeDuration = Duration(seconds: 0);
    _episodePosition = Duration(seconds: 0);
    _isPlayingAudio = false;
    _loadedPodcast = false;
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

  void resume() {
    if (_loadedPodcast) {
      _audioPlayer.resume();
      _isPlayingAudio = true;
      notifyListeners();
    }
  }

  void addAudioPlayerDurationListener(Function(Duration) listener) {
    _audioPlayer.onDurationChanged.listen(listener);
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void forward(Duration duration) {
    seek(_episodePosition + duration);
  }

  void replay(Duration duration) {
    seek(_episodePosition - duration);
  }

  void play(String episodeId) {
    Future<EpisodeFull> futureEpisodeFull = _api.getEpisode(episodeId);
    futureEpisodeFull.then((episodeFull) => {
          _audioPlayer.play(episodeFull.audio).then((result) {
            if (result == 1) {
              _loadedPodcast = true;
              _isPlayingAudio = true;
              _episodeTitle = episodeFull.title;
              _episodeImage = Image.network(episodeFull.image);
              _episodeThumbnail = Image.network(episodeFull.thumbnail);
              _episodePublisher = episodeFull.podcast.publisher;
              notifyListeners();
            }
          })
        });
  }
}
