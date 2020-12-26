part of swagger.api;

class TimingResult {
  /* the unique identifier of this user */
  String sessionId = null;
/* the version of the app that this user uses */
  String appVersion = null;
  //enum appVersionEnum {  without_feed,  with_feed,  };
/* the time (in seconds) between the user staring op the app and playing/queueing an episode */
  int time = null;
/* The action this user takes to end the logging of time. Either playing an episode or adding it to the queue. */
  String action = null;
  //enum actionEnum {  play,  queue,  };
/* The primary view from which the user has carried out the action to stop logging the time. */
  String primaryView = null;
  //enum primaryViewEnum {  feed,  search,  liked,  };

  String secondaryView = null;
  //enum secondaryViewEnum {  root,  podcast_details,  genre_details,  more_like_this,  };

  TimingResult();

  @override
  String toString() {
    return 'TimingResult[sessionId=$sessionId, appVersion=$appVersion, time=$time, action=$action, primaryView=$primaryView, secondaryView=$secondaryView, ]';
  }

  TimingResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    sessionId = json['session_id'];
    appVersion = json['app_version'];
    time = json['time'];
    action = json['action'];
    primaryView = json['primary_view'];
    secondaryView = json['secondary_view'];
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'app_version': appVersion,
      'time': time,
      'action': action,
      'primary_view': primaryView,
      'secondary_view': secondaryView
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
