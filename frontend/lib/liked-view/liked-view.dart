import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/liked-view/components/liked-episodes.dart';

class LikesWidget extends StatefulWidget {
  @override
  State<LikesWidget> createState() => LikesWidgetState();
}

class LikesWidgetState extends State<LikesWidget> {

  // mock data
  List<Genre> likedGenres = [
    new Genre(67, "Finance"),
    new Genre(12, "Health"),
    new Genre(33, "Technology"),
    new Genre(56, "News"),
  ];

  // mock data
  List<Episode> likedEpisodes = [
    new Episode("1,775: mkn",
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child:
        ListView(
          children: [
            SizedBox(height: 30),
            LikedGenresWidget(likedGenres),
            SizedBox(height: 30),
            LikedEpisodesWidget(likedEpisodes),


          ]
        )
      );
  }
}