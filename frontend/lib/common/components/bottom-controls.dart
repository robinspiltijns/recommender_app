import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/small-player.dart';

class BottomControlsWidget extends StatefulWidget {
  final ValueChanged<int> routeChanged;
  int selectedRouteIndex;

  BottomControlsWidget(this.selectedRouteIndex, this.routeChanged);

  @override
  _BottomControlsWidgetState createState() => _BottomControlsWidgetState();
}

class _BottomControlsWidgetState extends State<BottomControlsWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SmallPlayerWidget(),
        BottomNavigationBar(
        currentIndex: widget.selectedRouteIndex,
        elevation: 0.0,
        onTap: widget.routeChanged,
        backgroundColor: Color(0xff3F3C57),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xffEF476F),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      )],
    )
      ;
  }
}
