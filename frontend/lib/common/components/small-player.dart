import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'package:audioplayers/audioplayers.dart';

class SmallPlayerWidget extends StatelessWidget {

  playEpisode(EpisodeFull episodeFull) {
    final audio = episodeFull.audio;
    print(audio);
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(audio);
  }

  _onPlay() {
    final api = DefaultApi();
    Future<EpisodeFull> futureEpisode = api.getEpisode("02f0123246c944e289ee2bb90804e41b");
    futureEpisode.then((episodeFull) => {
       playEpisode(episodeFull)
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff3F3C57),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
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
                icon: Icon(Icons.play_arrow),
                onPressed: _onPlay
              )
            ),
          ],
        ));
  }
}
