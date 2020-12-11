import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/introductory-questions-view/screen-1.dart';
import 'package:frontend/introductory-questions-view/screen-2.dart';


class IntroductoryQuestionsPage extends StatelessWidget {

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
                }
              });
        }
    );
  }
}