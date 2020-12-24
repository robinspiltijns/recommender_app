import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
import 'package:frontend/object-model/genre.dart';
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
                    NavigateSecondaryViewNotification(
                        SecondaryView.ROOT
                    ).dispatch(context);
                    return SearchWidget();
                  case GenreDetails.routeName:
                    NavigateSecondaryViewNotification(
                        SecondaryView.GENRE_DETAILS
                    ).dispatch(context);
                    Genre genre = settings.arguments;
                    return GenreDetails(genre);
                  case PodcastDetails.routeName:
                    NavigateSecondaryViewNotification(
                        SecondaryView.PODCAST_DETAILS
                    ).dispatch(context);
                    String id = settings.arguments;
                    return PodcastDetails(id);
                }
                return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text("RouteName ${settings.name} does not exist for search view")
                );
              });
        }
    );
  }
}