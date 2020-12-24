import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
import 'package:frontend/player-view/components/player.dart';
import 'package:frontend/player-view/components/queue.dart';

class PlayerViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff28263B),
        appBar: AppBar(
          centerTitle: true,
          title: IconButton(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onPressed: () {
                TogglePlayerNotification(
                  PlayerSize.SMALL
                ).dispatch(context);
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        // TODO: Zie dat consumer later niet rond queue staat.
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: PlayerWidget(),
            ),
            SizedBox(height: 20),
            Container(
              child: QueueWidget(),
            )
          ],
        ));
  }
}

// ElevatedButton(
// onPressed: () {
// playerService
//     .play("02f0123246c944e289ee2bb90804e41b");
// },
// child: Text("start"),
// )
