import 'package:frontend/db-helper.dart';
import 'package:swagger/api.dart';


class Episode {

  final String title;
  final String id;
  final String imageUrl;
  final Duration duration;
  final Duration position;
  final String publisher;
  final String podcastId;
  final String description;
  final DateTime publishDate;

  Episode(this.title, this.id, this.imageUrl, this.duration, this.position, this.publisher, this.podcastId, this.description, this.publishDate);
  static Episode fromEpisodeFull(EpisodeFull episodeFull, {Duration position}) {
    var duration = Duration(seconds: episodeFull.audioLengthSec);
    if (position == null) {
      position = Duration(seconds: 0);
    }
    var pubDate = DateTime.fromMillisecondsSinceEpoch(episodeFull.pubDateMs);
    return new Episode(episodeFull.title, episodeFull.id, episodeFull.image, duration, position, episodeFull.podcast.publisher, episodeFull.podcast.id, episodeFull.description, pubDate);
  }

  //WARNING: EpisodeMinimum does not contain the podcast it is form, so the publisher and the podcastId of this Episode object are set to null.
  static Episode fromEpisodeMinimum(EpisodeMinimum episodeMinimum, {Duration position}) {
    var duration = Duration(seconds: episodeMinimum.audioLengthSec);
    if (position == null) {
      position = Duration(seconds: 0);
    }
    var pubDate = DateTime.fromMillisecondsSinceEpoch(episodeMinimum.pubDateMs);

    return new Episode(episodeMinimum.title, episodeMinimum.id, episodeMinimum.image, duration, position, null, null, episodeMinimum.description, pubDate);
  }

  static Episode fromEpisodeSearchResult(EpisodeSearchResult episodeSearchResult, {Duration position}) {
    var duration = Duration(seconds: episodeSearchResult.audioLengthSec);
    if (position == null) {
      position = Duration(seconds: 0);
    }
    var pubDate = DateTime.fromMillisecondsSinceEpoch(episodeSearchResult.pubDateMs);

    return new Episode(episodeSearchResult.titleOriginal, episodeSearchResult.id, episodeSearchResult.image, duration, position, null, null, episodeSearchResult.descriptionOriginal, pubDate);
  }

  static Episode fromEpisodeSimple(EpisodeSimple episodeSimple, {Duration position}) {
    var duration = Duration(seconds: episodeSimple.audioLengthSec);
    if (position == null) {
      position = Duration(seconds: 0);
    }
    var pubDate = DateTime.fromMillisecondsSinceEpoch(episodeSimple.pubDateMs);

    return new Episode(episodeSimple.title, episodeSimple.id, episodeSimple.image, duration, position, null, null, episodeSimple.description, pubDate);
  }

  static Episode fromDatabaseMap(Map<String, dynamic> map) {
    return Episode(
        map[DatabaseHelper.titleColumn],
        map[DatabaseHelper.idColumn],
        map[DatabaseHelper.imageColumn],
        Duration(seconds: map[DatabaseHelper.durationColumn]),
        Duration(seconds: map[DatabaseHelper.positionColumn]),
        map[DatabaseHelper.podcastIdColumn],
        map[DatabaseHelper.publisherColumn],
        map[DatabaseHelper.idColumn],
        map[DatabaseHelper.idColumn],
      );
  }

  Map<String, dynamic> toMap() {
      return <String, dynamic>{
        DatabaseHelper.idColumn: id,
        DatabaseHelper.titleColumn: title,
        DatabaseHelper.imageColumn: imageUrl,
        DatabaseHelper.durationColumn: duration.inSeconds,
        DatabaseHelper.positionColumn: duration.inSeconds,
        DatabaseHelper.publisherColumn: publisher,
        DatabaseHelper.podcastIdColumn: podcastId,
        DatabaseHelper.descriptionColumn: description,
        DatabaseHelper.publishDateColumn: publishDate.toIso8601String(),
    };
  }



}