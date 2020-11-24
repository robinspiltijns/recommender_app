import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  _onPlayButtonPress() {
    if (!isPlayingAudio) {
      Future<EpisodeFull> futureEpisode =
          api.getEpisode("02f0123246c944e289ee2bb90804e41b");
      futureEpisode.then((episodeFull) => {
            audioPlayer.play(episodeFull.audio).then((result) => {
                  if (result == 1)
                    {
                      this.setState(() {
                        isPlayingAudio = true;
                      })
                    }
                })
          });
    } else {
      audioPlayer.pause();
      this.setState(() {
        isPlayingAudio = false;
      });
    }
  }

  Icon get playButtonIcon {
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
              onPressed: null),
          Container(
              color: Color(0xff3F3C57),
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: AssetImage('assets/becoming-wise.jpg'),
                        )),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 80,
                      child: Text(
                        "Becoming wise episode #100: we are doing stuff",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 10,
                      child: IconButton(
                          color: Color(0xffEF476F),
                          icon: playButtonIcon,
                          onPressed: _onPlayButtonPress)),
                ],
              ))
        ],
      ),
    );
  }
}
