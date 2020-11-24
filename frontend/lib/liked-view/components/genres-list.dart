import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/components/genre-card.dart';

class LikedGenresWidget extends StatelessWidget {

  final List<Genre> _likedGenres;

  LikedGenresWidget(this._likedGenres);

  @override
  Widget build(BuildContext context) {
    return Column( // genres overview
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Your most liked genres",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 130/80,
          children: [
            GenreCard(_likedGenres[0]),
            GenreCard(_likedGenres[1]),
            GenreCard(_likedGenres[2]),
            GenreCard(_likedGenres[3]),
          ]
        )
      ]
    );
  }

}