import 'package:flutter/material.dart';
import 'package:frontend/common/components/genre-details-view/genre-details-view.dart';
import 'package:frontend/common/components/more-like-this-view/more-like-this-view.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
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
                    NavigateSecondaryViewNotification(
                        SecondaryView.ROOT
                    ).dispatch(context);
                    return LikesWidget();
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
                  case MoreLikeThis.routeName:
                    NavigateSecondaryViewNotification(
                        SecondaryView.MORE_LIKE_THIS
                    ).dispatch(context);
                    String id = settings.arguments;
                    return MoreLikeThis(id);
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