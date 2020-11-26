import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';

class PlayerViewWidget extends StatefulWidget {
  @override
  _PlayerViewWidgetState createState() => _PlayerViewWidgetState();
}

class _PlayerViewWidgetState extends State<PlayerViewWidget> {
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
    return Scaffold(
      backgroundColor: Color(0xff28263B),
      appBar: AppBar(
        title: IconButton(
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            // TODO: Dit zou cleaner moeten kunnen, maar dit is kinda functioneel dus weet niet meteen hoe.
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<PlayerService>(
        builder: (context, playerService, child) {
          return Column(
            children: [
              Image.network(playerService.currentlyPlayingImage),
              Text(playerService.currentlyPlayingTitle),
              Text(playerService.currentlyPlayingPublisher),
              IconButton(
                  color: Color(0xffEF476F),
                  icon:
                  getPlayButtonIcon(playerService.isPlayingAudio),
                  onPressed: () {
                    _onPlayButtonPress(playerService);
                  })
            ],
          );
        },
      )
    );
  }
}