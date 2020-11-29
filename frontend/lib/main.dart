import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/bottom-controls.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/feed-view/feed-view.dart';
import 'package:frontend/liked-view/liked-view.dart';
import 'package:frontend/search-view/search-view.dart';
import 'package:frontend/common/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
          create: (context) => PlayerService(),
          child: MyApp(),
  )
);

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

  static const TextStyle titleStyle =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0);

  static List<Widget> _titles = <Widget>[
    Text('Your Likes', style: titleStyle,),
    Text('Feed', style: titleStyle,),
    Text('Search', style: titleStyle,),
  ];

  static List<Widget> _destinationViews = <Widget>[
    LikesWidget(),
    FeedWidget(),
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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: _titles.elementAt(_selectedIndex),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: false,
        ),
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
