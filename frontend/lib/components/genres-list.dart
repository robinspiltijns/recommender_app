import 'package:flutter/cupertino.dart';
import 'package:frontend/components/genre-card.dart';
import 'package:frontend/object-model/genre.dart';

class GenresList extends StatelessWidget {
  
 final List<Genre> _genres;
 
 GenresList(this._genres);
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 13/8,
        children: _genres.map((genre) => GenreCard(genre)).toList()
    );
  }
}

