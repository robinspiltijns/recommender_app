import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';

class PlayerViewWidget extends StatefulWidget {
  @override
  _PlayerViewWidgetState createState() => _PlayerViewWidgetState();
}

class _PlayerViewWidgetState extends State<PlayerViewWidget> {

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
      body: Center(
        child: 
        Consumer<PlayerService>(
          builder: (context, playerService, child) {
            return ElevatedButton(
              onPressed: () {
                playerService.play("02f0123246c944e289ee2bb90804e41b");
              },
              child: Text("start"),
            );
          },
        )
      ),
    );
  }
}