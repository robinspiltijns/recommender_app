import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:swagger/api.dart' as swagger;

import 'genre-details-body.dart';

class GenreDetails extends StatelessWidget {

  static const String routeName = "/genre";

  final Genre genre;

  Future<swagger.BestPodcastsResponse> bestPodcastsOfGenre;

  GenreDetails(this.genre) {
    bestPodcastsOfGenre = swagger.DefaultApi().getBestOfGenre(genre.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genre overview", style: Theme.of(context).textTheme.headline5),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<swagger.BestPodcastsResponse>(
          future: bestPodcastsOfGenre,
          builder: (context, AsyncSnapshot<swagger.BestPodcastsResponse> snapshot) {
            if (snapshot.hasData) {
              return GenreDetailsBody(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )
      )
    );
  }
}


