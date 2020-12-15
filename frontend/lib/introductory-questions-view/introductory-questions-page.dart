import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/feed-view/feed-page.dart';
import 'package:frontend/introductory-questions-view/screen-1.dart';
import 'package:frontend/introductory-questions-view/screen-2.dart';
import 'package:frontend/main.dart';


class IntroductoryQuestionsPage extends StatelessWidget {

  PageRouteBuilder<Screen0neWidget> getScreenOne() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Screen0neWidget(),

    );
  }

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
                    return Screen0neWidget();
                  case ScreenTwoWidget.routeName:
                    return ScreenTwoWidget();
                  case "/introduction-done":
                    return CastlyWidget();
                }
              });
        }
    );
  }
}