import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'feed-view.dart';



class FeedPage extends StatelessWidget {

  static final GlobalKey<NavigatorState> feedNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
          key: feedNavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                settings: settings,
                //ignore: missing_return
                builder: (BuildContext context) {
                  switch (settings.name) {
                    case "/":
                      return FeedWidget();
                    case PodcastDetails.routeName:
                      return PodcastDetails("test");
                  }
                });
          }
      );
  }
}