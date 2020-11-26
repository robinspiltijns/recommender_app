import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/podcast-details-view/podcast-details-view.dart';

import 'feed-view.dart';

GlobalKey<NavigatorState> feedNavigatorKey = GlobalKey<NavigatorState>();


class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
          key: feedNavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            print("here");
            return MaterialPageRoute(
                settings: settings,
                builder: (BuildContext context) {
                  switch (settings.name) {
                    case "/":
                      return FeedWidget();
                    case "/details":
                      return PodcastDetails("test");
                    default:
                      return FeedWidget();
                  }
                });
          }
      );
  }
}