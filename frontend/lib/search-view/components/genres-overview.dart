import 'package:flutter/material.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:swagger/api.dart' as swagger;

class GenresOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<swagger.GetGenresResponse> (
        future: swagger.DefaultApi().getTopLevelGenres(),
        builder: (context,AsyncSnapshot<swagger.GetGenresResponse> snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20),
                      GenresWidget("Browse genres",
                          snapshot.data.genres.map(
                                  (swagger.Genre genre) => Genre.fromId(genre.id))
                              .toList()
                      ),
                    ]
                )
            );
          }
          return CircularProgressIndicator();
        }
    );
  }
}