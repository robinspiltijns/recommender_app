import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-card.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/theme.dart';


class SelectableGenreCard extends StatelessWidget {

  final Genre genre;
  final bool isSelected;

  SelectableGenreCard(this.genre, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: isSelected ?  Theme.of(context).buttonColor : Color.fromRGBO(2, 2, 2, 0),
        child: Container(
            margin: EdgeInsets.all(10),
            child: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: GenreCard.getGenreColor(genre.id),
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
        )
      ),
    );
  }
}



