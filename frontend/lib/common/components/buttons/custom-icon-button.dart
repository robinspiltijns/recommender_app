
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  static const double SQUARE_DIMENSIONS = 30;

  final IconData icon;

  CustomIconButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SQUARE_DIMENSIONS,
      height: SQUARE_DIMENSIONS,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).buttonColor,
      ),
      child: Icon(icon,
        color: Theme.of(context).primaryColor),
    );
  }
}