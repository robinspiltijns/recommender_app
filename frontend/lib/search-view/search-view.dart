import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:swagger/api.dart' as swagger;
import 'package:frontend/object-model/genre.dart';


class SearchWidget extends StatelessWidget {
  final api = swagger.DefaultApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            SearchFieldWidget(),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  //RecentSearchesWidget(),
                  SizedBox(height: 20),
                  FutureBuilder<swagger.GetGenresResponse> (
                    future: swagger.DefaultApi().getTopLevelGenres(),
                    builder: (context,
                        AsyncSnapshot<swagger.GetGenresResponse> snapshot) {
                      if (snapshot.hasData) {
                        return GenresWidget("Browse genres",
                            snapshot.data.genres.map(
                                    (swagger.Genre genre) => Genre(genre.id))
                                .toList()
                        );
                      }
                      return CircularProgressIndicator();
                    }
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
