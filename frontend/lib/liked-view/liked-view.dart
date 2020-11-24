import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/object-model/genre.dart';

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
  List<String> likedEpisodeIds = [
    "805535e1de5a4c7991f4f323e82ce9e7",
    "0c50725a87c64e66b8fe4d081c36bb00",
    "3f6ce02435e44eea9fd76ac650ee1c49",
    "c05fbbf0cd6a4f5fa5c5baf1b63e640a",
    "f9d5885d7cf7485d891e82dea3186640",
    "e3ae0115ca4f41d2a4e8bcbd94058255",
    "76ef931774714179ae3d23758fef52f8",
    "464433fd3bbe44febc4f7a0fe896316c",
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child:
        Column(
          children: [
            SizedBox(height: 30),
            LikedGenresWidget(likedGenres)
          ]
        )
      );
  }
}