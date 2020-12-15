import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:frontend/common/components/genre-card.dart';
import 'package:frontend/introductory-questions-view/components/genre-grid-view.dart';
import 'package:swagger/api.dart';
import 'package:frontend/object-model/genre.dart';

class ScreenTwoWidget extends StatefulWidget {

  static const String routeName = '/screen-2';

  @override
  _ScreenTwoWidgetState createState() => _ScreenTwoWidgetState();
}

class _ScreenTwoWidgetState extends State<ScreenTwoWidget> {

  final api = DefaultApi();


  Future<GetGenresResponse> genres;

  Container nextMessage;


  @override
  void initState() {
    super.initState();
    nextMessage = Container();
    getGenres();
  }

  getGenres() {
    genres = api.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff221E48), Color(0xff0F0C26)])),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [SizedBox(
            height: 50,
          ),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.center,
              child: Text(
                  "Select " + GenreGridView.MIN_NB_SELECTED_GENRES.toString() + " genres that interest you the most.",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            FutureBuilder <GetGenresResponse> (
              future: genres,
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<OwnGenre> genresList = OwnGenre.fromGetGenreResponse(snapshot.data);
                  return Expanded(child: GenreGridView(genresList));
                } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return Text("loading...");
              }
            )
          ],
        ),
      ),
    );
  }
}