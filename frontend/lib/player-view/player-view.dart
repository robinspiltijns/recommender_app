import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Hey"),
        ),
      ),
    );
  }
}