import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/components/genres-list.dart';

class LikedGenresWidget extends StatelessWidget {

  final List<Genre> likedGenres;

  LikedGenresWidget(this.likedGenres);

  @override
  Widget build(BuildContext context) {
    return Column( // genres overview
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your most liked genres",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        SizedBox(height: 10),
        GenresList(likedGenres),
      ]
    );
  }

}