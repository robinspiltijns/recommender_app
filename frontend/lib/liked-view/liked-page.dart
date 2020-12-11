import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
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
                }
                return Container();
              });
        }
    );
  }
}