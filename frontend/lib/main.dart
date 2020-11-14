import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Castly';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: CastlyWidget(),
    );
  }
}

class CastlyWidget extends StatefulWidget {
  @override
  _CastlyWidgetState createState() => _CastlyWidgetState();
}

class _CastlyWidgetState extends State<CastlyWidget> {
  int _selectedIndex = 1;
  // The style for the text that shows on which screen you are, should be removed when screens are implemented.
  static const TextStyle screenStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _bodyWidgetOptions = <Widget>[
    Text(
      'Profile',
      style: screenStyle,
    ),
    Text(
      'Feed',
      style: screenStyle,
    ),
    Text(
      'Search',
      style: screenStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Castly'),
      ),
      body: Center(
        child: _bodyWidgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Feed'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Feed'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent[700],
        onTap: _onItemTapped,
      ),
    );
  }
}