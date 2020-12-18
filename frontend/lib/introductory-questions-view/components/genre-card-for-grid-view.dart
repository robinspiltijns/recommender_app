import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/theme.dart';

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

class GenreCardForGridView extends StatelessWidget {
  final Genre genre;

  GenreCardForGridView(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: getGenreColor(genre.id),
                ),
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      genre.name,
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
