import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/introductory-questions-view/screen-1.dart';
import 'package:frontend/introductory-questions-view/screen-2.dart';
import 'package:frontend/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
                    setInitDone();
                    return CastlyWidget();
                }
              });
        }
    );
  }

  void setInitDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("initScreen", 1);
  }
}