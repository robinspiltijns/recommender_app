import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/search-results-view/search-results-view.dart';
import 'search-view.dart';




class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case "/":
                    return SearchWidget();
                  case SearchResultsViewWidget.routeName:
                    List<dynamic> searchResult = settings.arguments;
                    return SearchResultsViewWidget(arguments: searchResult,);
                  case GenreDetails.routeName:
                    Genre genre = settings.arguments;
                    return GenreDetails(genre);
                }
                return Container();
              });
        }
    );
  }
}