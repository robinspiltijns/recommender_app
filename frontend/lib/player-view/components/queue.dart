import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/episode.dart';

class QueueWidget extends StatefulWidget {
  _QueueWidgetState createState() => _QueueWidgetState();
}

class _QueueWidgetState extends State<QueueWidget> {

  // Mock
  List<Episode> episode = [
    new Episode("1,775: Happy 75th Birthday, George Lucas!",
        "02f0123246c944e289ee2bb90804e41b",
        "https://cdn-images-1.listennotes.com/podcasts/becoming-wise-on-being-studios-TP9tL1-admI-_S4ml0gj925.1400x1400.jpg",
        Duration(seconds: 865)),
    new Episode("1,775: Happy 75th Birthday, George Lucas!",
        "02f0123246c944e289ee2bb90804e41b",
        "https://cdn-images-1.listennotes.com/podcasts/becoming-wise-on-being-studios-TP9tL1-admI-_S4ml0gj925.1400x1400.jpg",
        Duration(seconds: 865)),
    new Episode("1,775: Happy 75th Birthday, George Lucas!",
        "02f0123246c944e289ee2bb90804e41b",
        "https://cdn-images-1.listennotes.com/podcasts/becoming-wise-on-being-studios-TP9tL1-admI-_S4ml0gj925.1400x1400.jpg",
        Duration(seconds: 865)),
    new Episode("1,775: Happy 75th Birthday, George Lucas!",
        "02f0123246c944e289ee2bb90804e41b",
        "https://cdn-images-1.listennotes.com/podcasts/becoming-wise-on-being-studios-TP9tL1-admI-_S4ml0gj925.1400x1400.jpg",
        Duration(seconds: 865)),
    new Episode("1,775: Happy 75th Birthday, George Lucas!",
        "02f0123246c944e289ee2bb90804e41b",
        "https://cdn-images-1.listennotes.com/podcasts/becoming-wise-on-being-studios-TP9tL1-admI-_S4ml0gj925.1400x1400.jpg",
        Duration(seconds: 865)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Queue",
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }

}