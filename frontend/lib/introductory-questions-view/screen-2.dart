import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTwoWidget extends StatefulWidget {

  static const String routeName = '/screen-2';

  @override
  _ScreenTwoWidgetState createState() => _ScreenTwoWidgetState();
}

class _ScreenTwoWidgetState extends State<ScreenTwoWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hi!",
        style: Theme
            .of(context)
            .textTheme
            .headline1,),
    );
  }
}