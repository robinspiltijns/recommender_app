import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';

class PlayerService extends ChangeNotifier {
  PlayerService() {
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

  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  String _episodeTitle = "No podcast playing at the moment";
  Image _episodeImage = Image.network(
      "https://image.freepik.com/free-vector/loading-icon_167801-436.jpg");
  Image _episodeThumbnail = Image.network(
      "https://image.freepik.com/free-vector/loading-icon_167801-436.jpg");
  String _episodePublisher = "unknown";
  Duration _episodeDuration = Duration(seconds: 0);
  Duration _episodePosition = Duration(seconds: 0);
  bool _isPlayingAudio = false;

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
    _audioPlayer.resume();
    _isPlayingAudio = true;
    notifyListeners();
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
