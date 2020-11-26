import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() callBack;

  CustomTextButton(this.text, {this.callBack});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: callBack,
            child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Theme.of(context).buttonColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child:
                      Text(text, style: Theme.of(context).textTheme.buttonText),
                ))));
  }
}
