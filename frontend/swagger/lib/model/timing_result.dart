part of swagger.api;

class TimingResult {
  /* the unique identifier of this user */
  String userId = null;
/* the version of the app that this user uses */
  String appVersion = null;
  //enum appVersionEnum {  without_feed,  with_feed,  };
/* the time (in seconds) between the user staring op the app and playing/queueing an episode */
  int time = null;
/* The action this user takes to end the logging of time. Either playing an episode or adding it to the queue. */
  String action = null;
  //enum actionEnum {  play,  queue,  };
/* The view from which the user has carried out the action to stop logging the time. */
  String view = null;
  //enum viewEnum {  feed,  podcast details,  search results,  more like this,  liked,  };

  TimingResult();

  @override
  String toString() {
    return 'TimingResult[userId=$userId, appVersion=$appVersion, time=$time, action=$action, view=$view, ]';
  }

  TimingResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    userId = json['user_id'];
    appVersion = json['app_version'];
    time = json['time'];
    action = json['action'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'app_version': appVersion,
      'time': time,
      'action': action,
      'view': view
     };
  }

  static List<TimingResult> listFromJson(List<dynamic> json) {
    return json == null ? new List<TimingResult>() : json.map((value) => new TimingResult.fromJson(value)).toList();
  }

  static Map<String, TimingResult> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TimingResult>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TimingResult.fromJson(value));
    }
    return map;
  }
}
