
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

class CustomTextButton extends StatelessWidget {
  
  final String text;
  
  CustomTextButton(this.text);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).buttonColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Text(text, style: Theme.of(context).textTheme.buttonText),
          )

        ]
      )
    );
  }
}