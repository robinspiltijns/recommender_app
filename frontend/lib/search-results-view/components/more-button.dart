
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

class MoreButton extends StatelessWidget {

  static const double HEIGHT = 30;
  static const double WIDTH = 90;

  final Text text = Text("More",
    style: TextStyle(color: Colors.white),
  );

  final Icon icon = Icon(Icons.expand_more_rounded,
    color: Colors.white,
  );

  MoreButton();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: HEIGHT,
        width: WIDTH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).buttonColor,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    this.icon,
                    SizedBox(width: 7,),
                    this.text
                  ],
                ),
              )

            ]
        )
    );
  }
}