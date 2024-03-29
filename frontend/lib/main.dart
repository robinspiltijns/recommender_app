import 'package:flutter/material.dart';
import 'package:frontend/common/components/bottom-controls.dart';
import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/common/services/logging-service/logging-notification-handler.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/common/services/user-name-service.dart';
import 'package:frontend/common/services/selected-genres-service.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/introductory-questions-view/introductory-questions-page.dart';
import 'package:frontend/liked-view/liked-page.dart';
import 'package:frontend/search-view/search-page.dart';
import 'package:frontend/common/theme.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feed-view/feed-page.dart';
import 'object-model/genre.dart';

// boolean to indicate whether or not to reset
// the database when launching the app.
bool resetDatabase = false;

// boolean to indicate whether or not to log timing data to the backend.
//   If false, logging results are printed on the standard output stream.
bool logTime = false;

AppVersion version = AppVersion.WITH_FEED;
LoggingNotificationHandler logger = LoggingNotificationHandler(version);

int initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database database;

  // Execute multiple asynchronous methods simultaneously
  await Future.wait([DatabaseHelper().database, Genre.getGenreNames()])
      .then((List result) => database = result[0]);

  QueueService queueService = QueueService(database);
  SelectedGenresService selectedGenresService = SelectedGenresService();
  LikedEpisodesService likedEpisodesService = LikedEpisodesService(database, selectedGenresService);
  PlayerService playerService = PlayerService(queueService);
  
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (resetDatabase) {
    // If you want to test the introductory questions, change the next line to "await prefs.setInt("initScreen", 0);" and press hot reload twice
    await prefs.setInt("initScreen", 0);
  }

  initScreen = prefs.getInt("initScreen");




  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => playerService,
          ),
          ChangeNotifierProvider(
            create: (context) => likedEpisodesService,
          ),
          ChangeNotifierProvider(
            create: (context) => queueService,
          ),
          ChangeNotifierProvider(
            create: (context) => UserNameService(database),
          ),
          ChangeNotifierProvider(
            create: (context) => selectedGenresService,
          )
        ],
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<LoggingNotification>(
      onNotification: (notification) {
        logger.handleLoggingNotification(notification);
        return true;
      },
      child: MaterialApp(
        theme: themeData,
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => CastlyWidget(),
          "first": (context) => IntroductoryQuestionsPage(),
        },
      ),
    );
  }
}

class CastlyWidget extends StatefulWidget {
  @override
  _CastlyWidgetState createState() => _CastlyWidgetState();
}

class _CastlyWidgetState extends State<CastlyWidget> with WidgetsBindingObserver {
  int _selectedIndex = 1;

  static List<Widget> _destinationViews = <Widget>[
    LikedPage(),
    FeedPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index, BuildContext context) {
    PrimaryView dest;
    switch (index) {
      case 0:
        dest = PrimaryView.LIKED;
        break;
      case 1:
        dest = PrimaryView.FEED;
        break;
      case 2:
        dest = PrimaryView.SEARCH;
        break;
    }
    NavigatePrimaryViewNotification(
      dest
    ).dispatch(context);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Add observer to listen for app state changes.
    WidgetsBinding.instance.addObserver(logger);

    // start timer in logging service.
    logger.startTime();

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
