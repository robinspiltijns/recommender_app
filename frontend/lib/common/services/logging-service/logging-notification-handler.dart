import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';

import 'logging-notification.dart';
import 'package:frontend/main.dart';

/// class to take care of logging the timing information.
class LoggingNotificationHandler with WidgetsBindingObserver {

  final DefaultApi api = DefaultApi();
  final Stopwatch stopwatch = Stopwatch();
  String sessionId;
  String appVersion;
  PrimaryView primaryView = PrimaryView.FEED;
  SecondaryView secondaryView = SecondaryView.ROOT;


  LoggingNotificationHandler(AppVersion appVersion) {

    api.getUniqueId().then((id) => this.sessionId = id);

    switch (appVersion) {
      case AppVersion.WITH_FEED:
        this.appVersion = "with_feed";
        break;
      case AppVersion.WITHOUT_FEED:
        this.appVersion = "without_feed";
        break;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        stopwatch.stop();
        break;
      case AppLifecycleState.resumed:
        stopwatch.start();
        break;
      case AppLifecycleState.paused:
        stopwatch.stop();
        break;
      case AppLifecycleState.detached:
        stopwatch.stop();
        break;
    }
  }


  void handleLoggingNotification(LoggingNotification not) {
    if (not is ActionNotification) {
      handleActionNotification(not);
    }

    if (not is NavigateSecondaryViewNotification) {
      secondaryView = not.destination;
    }

    if (not is NavigatePrimaryViewNotification) {
      primaryView = not.destination;
    }

    if (not is TogglePlayerNotification) {
      switch (not.playerSize) {
        case PlayerSize.SMALL:
          stopwatch.start();
          break;
        case PlayerSize.LARGE:
          stopwatch.stop();
          break;
      }
    }
  }

  void handleActionNotification(ActionNotification not) {
    TimingResult result = TimingResult();
    result.sessionId = sessionId;
    result.appVersion = appVersion;
    result.time = stopwatch.elapsedMilliseconds;
    switch (primaryView) {
      case PrimaryView.LIKED:
        result.primaryView = "liked";
        break;
      case PrimaryView.FEED:
        result.primaryView = "feed";
        break;
      case PrimaryView.SEARCH:
        result.primaryView = "search";
        break;
    }

    switch (secondaryView) {
      case SecondaryView.ROOT:
        result.secondaryView = "root";
        break;
      case SecondaryView.PODCAST_DETAILS:
        result.secondaryView = "podcast_details";
        break;
      case SecondaryView.MORE_LIKE_THIS:
        result.secondaryView = "more_like_this";
        break;
      case SecondaryView.GENRE_DETAILS:
        result.secondaryView = "genre_details";
        break;
    }

    switch (not.action) {
      case LoggingAction.QUEUE:
        result.action = "queue";
        break;
      case LoggingAction.PLAY:
        result.action = "play";
        break;
    }

    if (logTime) {
      api.logTimingResultPost(body: result);
    } else {
      print(result);
    }
    stopwatch.reset();
  }

  void startTime() {
    stopwatch.start();
  }
}

enum AppVersion {
  WITH_FEED,
  WITHOUT_FEED,
}