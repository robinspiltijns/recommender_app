part of swagger.api;

class TimingResultsData {
  /* The date and time this logging record was received. */
  String datetime = null;

  TimingResult result = null;

  TimingResultsData();

  @override
  String toString() {
    return 'TimingResultsData[datetime=$datetime, result=$result, ]';
  }

  TimingResultsData.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    datetime = json['datetime'];
    result = new TimingResult.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    return {
      'datetime': datetime,
      'result': result
     };
  }

  static List<TimingResultsData> listFromJson(List<dynamic> json) {
    return json == null ? new List<TimingResultsData>() : json.map((value) => new TimingResultsData.fromJson(value)).toList();
  }

  static Map<String, TimingResultsData> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TimingResultsData>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TimingResultsData.fromJson(value));
    }
    return map;
  }
}
