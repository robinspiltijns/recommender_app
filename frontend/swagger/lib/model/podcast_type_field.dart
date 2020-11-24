part of swagger.api;

class PodcastTypeField {
  /// The underlying value of this enum member.
  String value;

  PodcastTypeField._internal(this.value);

  /// The type of this podcast - episodic or serial.
  static PodcastTypeField episodic_ = PodcastTypeField._internal("episodic");
  /// The type of this podcast - episodic or serial.
  static PodcastTypeField serial_ = PodcastTypeField._internal("serial");

  PodcastTypeField.fromJson(dynamic data) {
    switch (data) {
          case "episodic": value = data; break;
          case "serial": value = data; break;
    default: throw('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(PodcastTypeField data) {
    return data.value;
  }
}