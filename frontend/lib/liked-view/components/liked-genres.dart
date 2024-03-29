import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/components/genres-list.dart';

class GenresWidget extends StatelessWidget {

  final List<Genre> likedGenres;
  final String title;

  GenresWidget(this.title, this.likedGenres);

  @override
  Widget build(BuildContext context) {
    return Column( // genres overview
      children: [
        Container(
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