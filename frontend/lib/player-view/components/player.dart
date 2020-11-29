import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';


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
    if (playerService.isPlaying) {
      playerService.pause();
    } else {
      playerService.resume();
    }
  }

  double getSliderPosition(PlayerService playerService) {
    return _isSeeking
        ? _seekingPosition
        : playerService.episodePosition.inSeconds
        .toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox.expand(
          child:
              Consumer<PlayerService>(builder: (context, playerService, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                  child: ClipRRect(
                    child: playerService.episodeImage,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox.expand(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(playerService.episodeTitle,
                          style: Theme.of(context).textTheme.episodeTitle),
                      SizedBox(height: 5),
                      Text(playerService.episodePublisher,
                          style:
                          Theme.of(context).textTheme.episodePublisher),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                        color: Colors.white),
                    SizedBox(width: 40),
                    IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                        color: Colors.white),
                  ],
                ),
                Slider(

                )
              ],
            );
          }),
        ));
  }
}
