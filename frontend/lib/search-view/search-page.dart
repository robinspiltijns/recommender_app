import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/search-results-view/search-results-view.dart';
import 'search-view.dart';
import 'package:swagger/api.dart';




class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              settings: settings,
              //ignore: missing_return
              builder: (BuildContext context) {
                switch (settings.name) {
                  case "/":
                    return SearchWidget();
                  case SearchResultsViewWidget.routeName:
                    final SearchResult searchResult = settings.arguments;
                    return SearchResultsViewWidget(searchResult: searchResult,);
                }
              });
        }
    );
  }
}