
class Utils {
  static String durationString(Duration duration) {
    String result = "";
    if (duration.inHours > 0) {
      if (duration.inHours == 1) {
        result += "1 hr";
      } else {
        result += "${duration.inHours} hrs";
      }
    }
    result += " ";
    if (duration.inMinutes.remainder(60) > 0) {
      if (duration.inMinutes.remainder(60) == 1) {
        result += "1 min";
      } else {
        result += "${duration.inMinutes.remainder(60)} mins";
      }
    }
    return result;
  }
}