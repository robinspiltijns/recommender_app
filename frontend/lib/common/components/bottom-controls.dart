import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/small-player.dart';

class BottomControlsWidget extends StatefulWidget {
  final Function(int, BuildContext) indexChanged;
  final int selectedRouteIndex;

  BottomControlsWidget(this.selectedRouteIndex, this.indexChanged);

  @override
  _BottomControlsWidgetState createState() => _BottomControlsWidgetState();
}

class _BottomControlsWidgetState extends State<BottomControlsWidget> {
  @override
  Widget build(BuildContext context) {

    Function(int) onItemSelected(int) {
      return widget.indexChanged(int, context);
    }

    return Container(
      color: Color(0xff3F3C57),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SmallPlayerWidget(),
          BottomNavyBar(
            selectedIndex: widget.selectedRouteIndex,
            showElevation: false,
            backgroundColor: Colors.transparent,
            onItemSelected: onItemSelected,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Likes'),
                  activeColor: Color(0xffEF476F),
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center),
              BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Feed'),
                  activeColor: Color(0xffEF476F),
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center),
              BottomNavyBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                  activeColor: Color(0xffEF476F),
                  inactiveColor: Colors.white,
                  textAlign: TextAlign.center),
            ],
          )
        ],
      ),
    );
  }
}
