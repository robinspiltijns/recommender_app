import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feed-view/feed-view.dart';
import 'package:frontend/liked-view/liked-view.dart';
import 'package:frontend/search-view/search-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CastlyWidget(),
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
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
    Text('Likes', style: titleStyle,),
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
        // Cfr. https://github.com/pedromassango/bottom_navy_bar https://www.youtube.com/watch?v=jJPSKEEiN-E
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: false,
          onItemSelected: _onItemTapped,
          backgroundColor: Colors.transparent,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Likes'),
                activeColor: Color(0xffEF476F),
                inactiveColor: Colors.white
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Feed'),
                activeColor: Color(0xffEF476F),
                inactiveColor: Colors.white
            ), BottomNavyBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                activeColor: Color(0xffEF476F),
                inactiveColor: Colors.white
            ),
          ],
        ),
      ),
    );
  }
}
