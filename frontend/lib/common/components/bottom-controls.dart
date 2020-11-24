import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomControlsWidget extends StatefulWidget {
  final ValueChanged<int> routeChanged;
  int selectedRouteIndex;

  BottomControlsWidget(this.selectedRouteIndex, this.routeChanged);

  @override
  _BottomControlsWidgetState createState() => _BottomControlsWidgetState();
}

class _BottomControlsWidgetState extends State<BottomControlsWidget> {
  int _selectedRouteIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: _selectedRouteIndex,
      showElevation: false,
      onItemSelected: widget.routeChanged,
      backgroundColor: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Likes'),
            activeColor: Color(0xffEF476F),
            inactiveColor: Colors.white),
        BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Feed'),
            activeColor: Color(0xffEF476F),
            inactiveColor: Colors.white),
        BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            activeColor: Color(0xffEF476F),
            inactiveColor: Colors.white),
      ],
    );
  }
}
