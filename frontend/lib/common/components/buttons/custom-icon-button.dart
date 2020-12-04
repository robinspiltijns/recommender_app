import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {@required this.icon,
      @required this.onTap,
      this.size = SQUARE_DIMENSIONS,
      this.color = const Color(0xFFEF476F)});

  static const double SQUARE_DIMENSIONS = 30;

  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).buttonColor,
          ),
          child: Icon(
            icon,
            color: color,
            size: size * 0.69,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
