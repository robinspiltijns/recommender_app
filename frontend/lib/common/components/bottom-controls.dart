import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/small-player.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';

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
            onItemSelected: widget.routeChanged,
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
