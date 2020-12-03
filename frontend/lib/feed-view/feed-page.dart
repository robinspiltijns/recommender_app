import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'feed-view.dart';



class FeedPage extends StatelessWidget {

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
                      return FeedWidget();
                    case PodcastDetails.routeName:
                      final String id = settings.arguments;
                      return PodcastDetails(id);
                  }
                });
          }
      );
  }
}