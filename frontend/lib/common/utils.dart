
import 'package:intl/intl.dart';

class Utils {
  static String durationString(Duration duration) {
    String result = "";
    if (duration.inHours > 0) {
      if (duration.inHours == 1) {
        result += "1 hr ";
      } else {
        result += "${duration.inHours} hrs ";
      }
    }
    if (duration.inMinutes.remainder(60) > 0) {
      if (duration.inMinutes.remainder(60) == 1) {
        result += "1 min";
      } else {
        result += "${duration.inMinutes.remainder(60)} mins";
      }
    }
    return result;
  }

  static String releaseDateDurationString(DateTime dateTime, int audioLengthSec) {
    return DateFormat.yMMMMd('en_US').format(dateTime) +
        " - " +
        Utils.durationString(Duration(seconds: audioLengthSec));
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}