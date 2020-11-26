import 'package:flutter/material.dart';
import 'package:frontend/common/components/bottom-controls.dart';
import 'package:frontend/feed-view/feed-page.dart';
import 'package:frontend/liked-view/liked-view.dart';
import 'package:frontend/search-view/search-view.dart';
import 'package:frontend/common/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CastlyWidget(),
      theme: themeData,
    );
  }
}

class CastlyWidget extends StatefulWidget {
  @override
  _CastlyWidgetState createState() => _CastlyWidgetState();
}

class _CastlyWidgetState extends State<CastlyWidget> {
  int _selectedIndex = 1;

  static List<Widget> _destinationViews = <Widget>[
    LikesWidget(),
    FeedPage(),
    SearchWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff221E48), Color(0xff0F0C26)])),
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _destinationViews,
        ),
        // We kunnen dit eventueel later nog custom doen.
        bottomNavigationBar: BottomControlsWidget(_selectedIndex, _onItemTapped),
      ),
    );
  }
}
