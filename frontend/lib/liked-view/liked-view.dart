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

  List<Episode> likedEpisodes = [
    Episode.initialEpisode(),
    Episode.initialEpisode(),
    Episode.initialEpisode(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Likes", style: Theme.of(context).textTheme.headline6),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: false,
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(children: [
              SizedBox(height: 30),
              GenresWidget("Your most liked genres", likedGenres),
              SizedBox(height: 30),
              LikedEpisodesWidget(likedEpisodes),
            ])));
  }
}
