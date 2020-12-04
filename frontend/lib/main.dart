import 'package:flutter/material.dart';
import 'package:frontend/common/components/bottom-controls.dart';
import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/liked-view/liked-view.dart';
import 'package:frontend/search-view/search-view.dart';
import 'package:frontend/common/theme.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'feed-view/feed-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database database = await DatabaseHelper().database;
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PlayerService(),
          ),
          ChangeNotifierProvider(
            create: (context) => LikedEpisodesService(database),
          ),
          ChangeNotifierProvider(
            create: (context) => QueueService(database),
          )
        ],
        child: MyApp(),
    )
  );
}

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
        resizeToAvoidBottomPadding: false,
        body: IndexedStack(
          index: _selectedIndex,
          children: _destinationViews,
        ),
        // We kunnen dit eventueel later nog custom doen.
        bottomNavigationBar:
            BottomControlsWidget(_selectedIndex, _onItemTapped),
      ),
    );
  }
}
