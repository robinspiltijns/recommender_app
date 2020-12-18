import 'package:flutter/material.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/introductory-questions-view/components/genre-card-for-grid-view.dart';


class SelectableGenreCard extends StatelessWidget {

  final Genre genre;
  final bool isSelected;

  SelectableGenreCard(this.genre, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(5),
        color: isSelected ?  Theme.of(context).buttonColor : Color.fromRGBO(2, 2, 2, 0),
        child: GenreCardForGridView(genre),
      ),
    );
  }
}



