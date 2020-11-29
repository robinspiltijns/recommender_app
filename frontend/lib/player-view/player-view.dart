import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/player-view/components/time-slider.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';

class PlayerViewWidget extends StatefulWidget {
  @override
  _PlayerViewWidgetState createState() => _PlayerViewWidgetState();
}

class _PlayerViewWidgetState extends State<PlayerViewWidget> {
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

  VoidCallback _forwardThirty(PlayerService playerService) {
    return () => playerService.forward(Duration(seconds: 30));
  }

  VoidCallback _replayTen(PlayerService playerService) {
    return () => playerService.replay(Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff28263B),
        appBar: AppBar(
          centerTitle: true,
          title: IconButton(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        // TODO: Zie dat consumer later niet rond queue staat.
        body: Consumer<PlayerService>(
          builder: (context, playerService, child) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox.expand(
                  child: Column(
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
                      Column(
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
                      TimeSliderWidget(),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.replay_10),
                              onPressed: _replayTen(playerService),
                              color: Colors.white),
                          SizedBox(width: 40),
                          IconButton(
                              color: Color(0xffEF476F),
                              iconSize: 48.0,
                              icon: getPlayButtonIcon(
                                  playerService.isPlaying),
                              onPressed: () {
                                _onPlayButtonPress(playerService);
                              }),
                          SizedBox(width: 40),
                          IconButton(
                              icon: Icon(Icons.forward_30),
                              onPressed: _forwardThirty(playerService),
                              color: Colors.white),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playerService
                              .play("02f0123246c944e289ee2bb90804e41b");
                        },
                        child: Text("start"),
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
