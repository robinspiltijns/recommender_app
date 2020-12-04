import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:swagger/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerService extends ChangeNotifier {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _api = DefaultApi();

  Episode _episode;

  String _episodeAudio;

  AudioPlayerState _audioPlayerState;

  PlayerService() {
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

  Episode get episode {
    return _episode;
  }

  String get episodeTitle {
    if (_episode == null) {
      return "No currently playing episode.";
    }
    return _episode.title;
  }

  String get episodeId {
    if (_episode == null) {
      return "";
    }
    return _episode.id;
  }

  Duration get episodeDuration {
    if (_episode == null) {
      return Duration(seconds: 0);
    }
    return _episode.duration;
  }

  Duration get episodePosition {
    if (_episode == null) {
      return Duration(seconds: 0);
    }
    return _episode.position;
  }

  Image get episodeImage {
    if (_episode == null) {
      return Image.asset('assets/no-podcast.png');
    }
    return Image(
      image: CachedNetworkImageProvider(_episode.imageUrl)
    );
  }

  Image get episodeThumbnail {
    if (_episode == null) {
      return Image.asset('assets/no-podcast.png');
    }
    return Image(
        image: CachedNetworkImageProvider(_episode.imageUrl)
    );
  }

  String get episodePublisher {
    if (_episode == null) {
      return "Unavailable";
    }
    return _episode.publisher;
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
            _audioPlayer.seek(_episode.position);
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
    seek(_episode.position + Duration(seconds: seconds));
  }

  void replay(int seconds) {
    seek(_episode.position - Duration(seconds: seconds));
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
    _episodeAudio = episodeFull.audio;

    _episode = Episode(
        episodeFull.title,
        episodeFull.id,
        episodeFull.image,
        Duration(seconds: episodeFull.audioLengthSec),
        Duration(seconds: resumePoint),
        episodeFull.podcast.publisher,
        episodeFull.podcast.id,
        episodeFull.description,
        DateTime.fromMillisecondsSinceEpoch(episodeFull.pubDateMs)
    );


  }

  void play(String episodeId) {
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
