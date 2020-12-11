import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swagger/api.dart';

class GenreDetails extends StatelessWidget {

  static const String routeName = "/genre";

  final Genre genre;
  Future<BestPodcastsResponse> bestPodcastsOfGenre;


  GenreDetails(this.genre) {
    bestPodcastsOfGenre = DefaultApi().getBestOfGenre(genre.id.toString());
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
        child: FutureBuilder<BestPodcastsResponse>(
          future: bestPodcastsOfGenre,
          builder: (context, AsyncSnapshot<BestPodcastsResponse> snapshot) {
            if (snapshot.hasData) {
              return GenreDetailsBody(snapshot.data.podcasts);
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

class GenreDetailsBody extends StatelessWidget {

  List<PodcastSimple> podcasts;

  GenreDetailsBody(this.podcasts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
