
import 'package:flutter/widgets.dart';

class LoggingNotification extends Notification {

  final LoggingAction action;
  final Route route;
  final String destination;

  LoggingNotification({@required this.action, @required this.route, this.destination});

}


enum LoggingAction {
  PLAY,
  QUEUE,
  NAVIGATE
}