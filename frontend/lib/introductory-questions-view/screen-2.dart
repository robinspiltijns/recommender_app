import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:frontend/common/components/genre-card.dart';
import 'package:frontend/introductory-questions-view/components/genre-grid-view.dart';
import 'package:frontend/object-model/genre.dart';

class ScreenTwoWidget extends StatefulWidget {

  static const String routeName = '/screen-2';

  @override
  _ScreenTwoWidgetState createState() => _ScreenTwoWidgetState();
}

class _ScreenTwoWidgetState extends State<ScreenTwoWidget> {

  List<Genre> genres = [
    new Genre(67, "Finance"),
    new Genre(12, "Health"),
    new Genre(33, "Technology"),
    new Genre(56, "News"),
  ];

  GenreGridView genreGridView;
  Container nextMessage;

  onPressed(BuildContext context){
    if (genreGridView.of(context).selectedGenres != null) {
      if (genreGridView.of(context).selectedGenres.length > 1) {
        //todo: ga naar het volgende
      } else {
        nextMessage = Container(child: Text("Select at least one genre to get started.", style: TextStyle(color: Colors.white),),);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    genreGridView = GenreGridView(genres);
    nextMessage = Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [SizedBox(
        height: 50,
      ),
        Expanded(child: genreGridView),

      ],
    );
  }
}