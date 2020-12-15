import 'package:flutter/material.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/introductory-questions-view/components/selectable-genre-card.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:provider/provider.dart';


class GenreGridView extends StatefulWidget {

  static const MAX_NB_SELECTED_GENRES = 4;
  static const MIN_NB_SELECTED_GENRES = 4;

  final List<OwnGenre> genres;

  GenreGridView(this.genres);

  @override
  _GenreGridViewState createState() => _GenreGridViewState();
}

class _GenreGridViewState extends State<GenreGridView> {

  List<OwnGenre> selectedGenres;
  Container nextMessage;

  @override
  void initState() {
    super.initState();
    selectedGenres = [];
    nextMessage = Container();
  }

  selectLogic(OwnGenre genre) {
    if (selectedGenres.length < GenreGridView.MAX_NB_SELECTED_GENRES) {
      selectedGenres.contains(genre) ? selectedGenres.remove(genre) : selectedGenres.add(genre);
    } else {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      }
    }


  }

  onPressed(BuildContext context, SelectedGenresService selectedGenresService){
      if (selectedGenres.length >= GenreGridView.MIN_NB_SELECTED_GENRES) {
        for (var selGenre in selectedGenres) {
          selectedGenresService.insertSelectedGenre(selGenre);
        }
        Navigator.pushNamed(
            context,
            "/introduction-done"
        );
      } else {
        setState(() {
          nextMessage = Container(
            child: Text("Select at least " + GenreGridView.MIN_NB_SELECTED_GENRES.toString() + " genres to get started.", style: TextStyle(color: Colors.white),),
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
        SizedBox(
          height: 20,
        ),
        Consumer<SelectedGenresService>(
        builder: (context, selectedGenresService, child) {
          return InkWell(
              onTap: () {onPressed(context, selectedGenresService);},
              child: Container(
                  height: 40,
                  width: 70,
                  child: CustomTextButton("Next", color: Colors.white)
              )
          );}
        ),
        SizedBox(
          height: 50,
          child: nextMessage,
        )
      ],
    );
  }
}