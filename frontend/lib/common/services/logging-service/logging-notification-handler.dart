import 'package:swagger/api.dart';

import 'logging-notification.dart';

/// class to take care of logging the timing information.
class LoggingNotificationHandler {

  TimingResult timingResult = TimingResult();
  final DefaultApi api = DefaultApi();
  final Stopwatch stopwatch = Stopwatch();

  LoggingNotificationHandler(AppVersion appVersion) {

    api.getUniqueId().then((id) => this.timingResult.userId = id);

    switch (appVersion) {
      case AppVersion.WITH_FEED:
        this.timingResult.appVersion = "with_feed";
        break;
      case AppVersion.WITHOUT_FEED:
        this.timingResult.appVersion = "without_feed";
        break;
    }

  }


  void handleLoggingNotification(LoggingNotification not) {
    if (not is ActionNotification) {
      print(not.action);
    }

    if (not is NavigateSecondaryViewNotification) {
      print(not.destination);
    }

    if (not is NavigatePrimaryViewNotification) {
      print(not.destination);
    }

    if (not is TogglePlayerNotification) {
      print(not.playerSize);
    }


  }

}

enum AppVersion {
  WITH_FEED,
  WITHOUT_FEED,
}