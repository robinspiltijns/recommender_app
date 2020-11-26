import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/player-view/player-view.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:audioplayers/audioplayers.dart';

class SmallPlayerWidget extends StatefulWidget {
  @override
  _SmallPlayerWidgetState createState() => _SmallPlayerWidgetState();
}

class _SmallPlayerWidgetState extends State<SmallPlayerWidget> {
  // TODO: Permission to play audio a long time. (https://pub.dev/documentation/audioplayers/latest/)

  final AudioPlayer audioPlayer = AudioPlayer();
  final api = DefaultApi();

  bool isPlayingAudio = false;

  _onPlayButtonPress(PlayerService playerService) {
    if (playerService.isPlayingAudio) {
      playerService.pause();
    } else {
      playerService.resume();
    }
  }

  _onOpenPlayerPress() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PlayerViewWidget(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
  }

  Icon getPlayButtonIcon(bool isPlayingAudio) {
    return isPlayingAudio ? Icon(Icons.pause) : Icon(Icons.play_arrow);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3F3C57),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
              // TODO: Dit zou cleaner moeten kunnen, maar dit is kinda functioneel dus weet niet meteen hoe.
              onPressed: () {
                Navigator.of(context).push(_onOpenPlayerPress());
              }),
          Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Consumer<PlayerService>(
                  builder: (context, playerService, child) {
                return Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(playerService.currentlyPlayingThumbnail)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        flex: 80,
                        child: Text(
                          playerService.currentlyPlayingTitle,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    SizedBox(width: 10),
                    Expanded(
                        flex: 10,
                        child: IconButton(
                            color: Color(0xffEF476F),
                            icon:
                                getPlayButtonIcon(playerService.isPlayingAudio),
                            onPressed: () {
                              _onPlayButtonPress(playerService);
                            })),
                  ],
                );
              }))
        ],
      ),
    );
  }
}
