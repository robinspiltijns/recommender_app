
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final IconData icon;

  CustomIconButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).buttonColor,
      ),
      child: Icon(icon,
        color: Theme.of(context).primaryColor),
    );
  }
}