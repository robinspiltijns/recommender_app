import 'package:flutter/material.dart';
import 'package:frontend/introductory-questions-view/components/selectable-genre-card.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';


class GenreGridView extends StatefulWidget {

  static const MAX_NB_SELECTED_GENRES = 3;
  _GenreGridViewState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_GenreGridViewState>());

  final List<Genre> genres;

  GenreGridView(this.genres);

  @override
  _GenreGridViewState createState() => _GenreGridViewState();
}

class _GenreGridViewState extends State<GenreGridView> {

  List<Genre> selectedGenres;
  Container nextMessage;

  @override
  void initState() {
    super.initState();
    selectedGenres = [];
    nextMessage = Container();
  }

  selectLogic(Genre genre) {
    if (selectedGenres.length < GenreGridView.MAX_NB_SELECTED_GENRES) {
      selectedGenres.contains(genre) ? selectedGenres.remove(genre) : selectedGenres.add(genre);
    } else {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      }
    }


  }

  onPressed(BuildContext context){
      if (selectedGenres.length > 1) {
        //todo: ga naar het volgende
      } else {
        setState(() {
          nextMessage = Container(
            child: Text("Select at least one genre to get started.", style: TextStyle(color: Colors.white),),
            margin: EdgeInsets.only(top: 20),
          );
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.7, // Sets the aspect ratio of the GridView items
            crossAxisCount: 2, // The number of items per row
            mainAxisSpacing: 10, // Spacing between rows
            crossAxisSpacing: 10, // Spacing between columns
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            children: this.widget.genres.map((genre) { // Iterate through _icons as a map
              // For each icon in the _icons list, return a widget
              return GestureDetector(
                onTap: () {
                  setState(() {selectLogic(genre);});
                },
                child: SelectableGenreCard(genre, selectedGenres.contains(genre)), // Pass iconData and a boolean that specifies if the icon is selected or not
              );
            }).toList(), // Convert the map to a list of widgets
          ),
        ),
        InkWell(
            onTap: () {onPressed(context);},
            child: Container(
                height: 40,
                width: 70,
                child: CustomTextButton("Next", color: Colors.white,)
            )
        ),
        SizedBox(
          height: 50,
          child: nextMessage,
        )
      ],
    );
  }
}