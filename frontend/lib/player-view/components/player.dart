import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';


class PlayerWidget extends StatefulWidget {
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {

  bool _isSeeking = false;
  double _seekingPosition = 0;

  Icon getPlayButtonIcon(bool isPlayingAudio) {
    return isPlayingAudio ? Icon(Icons.pause) : Icon(Icons.play_arrow);
  }

  _onPlayButtonPress(PlayerService playerService) {
    if (playerService.isPlayingAudio) {
      playerService.pause();
    } else {
      playerService.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}