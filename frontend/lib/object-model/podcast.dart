import 'package:swagger/api.dart';

class Podcast {

  final String title;
  final String description;
  final String imageUrl;

  Podcast(this.title, this.description, this.imageUrl);

  static Podcast fromSearchResult(PodcastSearchResult result) {
    return Podcast(
      result.titleOriginal,
      result.descriptionOriginal,
      result.image
    );
  }

  static Podcast fromPodcastSipmle(PodcastSimple podcastSimple) {
    return Podcast(
      podcastSimple.title,
      podcastSimple.description,
      podcastSimple.image
    );
  }

}