import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

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

  static const List<Widget> _titles = <Widget>[
    Text(
      'Profile',
      style: titleStyle,
    ),
    Text(
      'Feed',
      style: titleStyle,
    ),
    Text(
      'Search',
      style: titleStyle,
    ),
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
      // TODO: Use different scaffolds per page?
      child: Scaffold(
        appBar: AppBar(
          title: _titles.elementAt(_selectedIndex),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: false,
        ),
        body: Center(
              child: _titles.elementAt(_selectedIndex),
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
                title: Text('Profile'),
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
