import 'package:swagger/api.dart';

class Podcast {

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String producer;

  Podcast(this.id, this.title, this.description, this.imageUrl, this.producer);

  static Podcast fromSearchResult(PodcastSearchResult result) {
    return Podcast(
      result.id,
      result.titleOriginal,
      result.descriptionOriginal,
      result.image,
      result.publisherOriginal
    );
  }

  static Podcast fromPodcastSimple(PodcastSimple podcastSimple) {
    return Podcast(
      podcastSimple.id,
      podcastSimple.title,
      podcastSimple.description,
      podcastSimple.image,
      podcastSimple.publisher
    );
  }

}