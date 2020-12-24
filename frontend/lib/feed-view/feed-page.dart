import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
import 'feed-view.dart';



class FeedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            switch (settings.name) {
              case "/":
                NavigateSecondaryViewNotification(
                    SecondaryView.ROOT
                ).dispatch(context);
                return FeedWidget();
              case PodcastDetails.routeName:
                NavigateSecondaryViewNotification(
                    SecondaryView.PODCAST_DETAILS
                ).dispatch(context);
                final String id = settings.arguments;
                return PodcastDetails(id);
              default:
                return FeedWidget();
            }
          }
        );
      }
    );
  }
}