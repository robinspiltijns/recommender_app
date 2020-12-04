import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() callBack;
  final Color color;

  CustomTextButton(this.text, {this.callBack, this.color});

  TextStyle getTextStyle(BuildContext context) {
    if (color == null) {
      return Theme.of(context).textTheme.buttonText;
    } else {
      return TextStyle(
        fontSize: 12.0,
        color: this.color,
        fontWeight: FontWeight.w700,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: callBack,
          child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Theme.of(context).buttonColor,
              ),
              child: Center(
                child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: getTextStyle(context),
                    ),
              ))));
  }
}
