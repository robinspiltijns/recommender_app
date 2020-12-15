import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/object-model/genre.dart';
import 'liked-view.dart';


class LikedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case "/":
                    return LikesWidget();
                  case GenreDetails.routeName:
                    Genre genre = settings.arguments;
                    return GenreDetails(genre);
                  case PodcastDetails.routeName:
                    String id = settings.arguments;
                    return PodcastDetails(id);
                }
                return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text("RouteName ${settings.name} does not exist for likes view")
                );
              });
        }
    );
  }
}