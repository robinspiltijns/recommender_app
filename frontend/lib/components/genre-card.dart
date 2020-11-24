import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/theme.dart';

List<Color> GENRE_COLORS = [
  Color(0xFF9BC995),
  Color(0xFFDF2935),
  Color(0xFFA78682),
  Color(0xFF98B9AB),
  Color(0xFFF1A208),
  Color(0xFF84ACCE),
  Color(0xFF06A77D),
  Color(0xFFF17300),
];

class GenreCard extends StatelessWidget {
  final Genre _genre;

  GenreCard(this._genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: getGenreColor(this._genre.getId())),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(
              _genre.getName(),
              style: Theme.of(context).textTheme.genreTitle,
            )
          )
        )
      )
    );

  }

  Color getGenreColor(int id) {
    return GENRE_COLORS[id % GENRE_COLORS.length];
  }
}
