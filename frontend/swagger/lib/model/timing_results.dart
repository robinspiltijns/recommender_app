part of swagger.api;

class TimingResults {
  /* The date and time when these logging results were produced. */
  String datetime = null;
/* The logging data */
  List<TimingResultsData> data = [];

  TimingResults();

  @override
  String toString() {
    return 'TimingResults[datetime=$datetime, data=$data, ]';
  }

  TimingResults.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    datetime = json['datetime'];
    data = TimingResultsData.listFromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'datetime': datetime,
      'data': data
     };
  }

  static List<TimingResults> listFromJson(List<dynamic> json) {
    return json == null ? new List<TimingResults>() : json.map((value) => new TimingResults.fromJson(value)).toList();
  }

  static Map<String, TimingResults> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TimingResults>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TimingResults.fromJson(value));
    }
    return map;
  }
}
