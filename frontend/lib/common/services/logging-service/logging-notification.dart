
import 'package:flutter/widgets.dart';

abstract class LoggingNotification extends Notification {

}


class ActionNotification extends LoggingNotification {

  final LoggingAction action;

  ActionNotification(this.action);

}

enum LoggingAction {
  PLAY,
  QUEUE
}

class TogglePlayerNotification extends LoggingNotification {

  final bool playerActive;

  TogglePlayerNotification(this.playerActive);
}

class NavigatePrimaryViewNotification extends LoggingNotification {

  final PrimaryView destination;

  NavigatePrimaryViewNotification(this.destination);

}

enum PrimaryView {
  LIKED,
  FEED,
  SEARCH,
}

class NavigateSecondaryViewNotification extends LoggingNotification {

  final SecondaryView destination;

  NavigateSecondaryViewNotification(this.destination);

}

enum SecondaryView {
  ROOT,
  PODCAST_DETAILS,
  GENRE_DETAILS,
  MORE_LIKE_THIS
}