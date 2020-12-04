
import 'package:frontend/object-model/episode.dart';

class TestUtils {
  static bool episodesEqual(Episode episode1, Episode episode2) {
    return
          episode1.id == episode2.id &&
          episode1.title == episode2.title &&
          episode1.imageUrl == episode2.imageUrl &&
          episode1.publisher == episode2.publisher &&
          episode1.podcastId == episode2.podcastId &&
          episode1.duration.compareTo(episode2.duration) == 0 &&
          episode1.position.compareTo(episode2.position) == 0 &&
          episode1.publishDate.compareTo(episode2.publishDate) == 0 &&
          episode1.description == episode2.description;
  }
}