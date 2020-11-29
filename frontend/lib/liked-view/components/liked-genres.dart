import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/components/genres-list.dart';

class LikedGenresWidget extends StatelessWidget {

  final List<Genre> likedGenres;
  final String title;

  LikedGenresWidget(this.title, this.likedGenres);

  @override
  Widget build(BuildContext context) {
    return Column( // genres overview
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
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