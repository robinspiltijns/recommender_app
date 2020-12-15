import 'package:flutter/cupertino.dart';
import 'package:frontend/common/components/genre-card.dart';
import 'package:frontend/object-model/genre.dart';

class GenresList extends StatelessWidget {
  
 final List<OwnGenre> genres;
 
 GenresList(this.genres);
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 13/8,
        children: genres.map((genre) => GenreCard(genre)).toList()
    );
  }
}

