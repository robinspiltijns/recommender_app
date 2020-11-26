import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)

  final AudioPlayer audioPlayer = AudioPlayer();
  final api = DefaultApi();

  String _currentlyPlayingTitle = "No podcast playing at the moment";
  Image _currentlyPlayingImage = Image(image: AssetImage('assets/becoming-wise.jpg'));
  String _currentlyPlayingThumbnail = "https://image.freepik.com/free-vector/loading-icon_167801-436.jpg";
  String _currentlyPlayingPublisher = "unknown";

  bool _isPlayingAudio = false;

  bool get isPlayingAudio {
    return _isPlayingAudio;
  }

  String get currentlyPlayingTitle {
    return _currentlyPlayingTitle;
  }

  //Misschien image storen ipv string.
  Image get currentlyPlayingImage {
    return _currentlyPlayingImage;
  }

  String get currentlyPlayingThumbnail {
    return _currentlyPlayingThumbnail;
  }

  String get currentlyPlayingPublisher {
    return _currentlyPlayingPublisher;
  }

  void pause() {
    audioPlayer.pause();
    _isPlayingAudio = false;
    notifyListeners();
  }

  void resume() {
    audioPlayer.resume();
    _isPlayingAudio = true;
    notifyListeners();
  }

  void play(String episodeId) {
    Future<EpisodeFull> futureEpisodeFull = api.getEpisode(episodeId);
    futureEpisodeFull.then((episodeFull) => {
          audioPlayer.play(episodeFull.audio).then((result) {
            if (result == 1) {
              _isPlayingAudio = true;
              _currentlyPlayingTitle = episodeFull.title;
              _currentlyPlayingImage = Image.network(episodeFull.image);
              _currentlyPlayingThumbnail = episodeFull.thumbnail;
              _currentlyPlayingPublisher = episodeFull.podcast.publisher;
              notifyListeners();
            }
          })
        });
  }
}
