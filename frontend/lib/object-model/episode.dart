import 'dart:convert';

import 'package:frontend/db-helper.dart';
import 'package:swagger/api.dart' as swagger;

import 'genre.dart';

class Episode {

  static final api = swagger.DefaultApi();

  String title;
  String id;
  String audio;
  String imageUrl;
  Duration duration;
  // TODO: Denk eens na of dit ook final moet/kan.
  Duration position;
  String publisher;
  String podcastId;
  String description;
  DateTime publishDate;
  List<Genre> genres;

  Episode(
      this.title,
      this.id,
      this.audio,
      this.imageUrl,
      this.duration,
      this.position,
      this.publisher,
      this.podcastId,
      this.description,
      this.publishDate,
      this.genres);

  static Episode fromEpisodeFull(swagger.EpisodeFull episodeFull,
      {Duration position}) {

    List<int> genreIds;
    api.getPodcast(episodeFull.podcast.id).then((podcast) => genreIds = podcast.genreIds.toList() ?? []);

    return new Episode(
      episodeFull.title ?? " ",
      episodeFull.id,
      episodeFull.audio, episodeFull.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
      Duration(seconds: episodeFull.audioLengthSec ?? 0),
      position ?? Duration(seconds: 0),
      episodeFull.podcast.publisher ?? " ",
      episodeFull.podcast.id,
      episodeFull.description ?? " ",
      DateTime.fromMillisecondsSinceEpoch(episodeFull.pubDateMs ?? 0),
      genreIds.map((id) => Genre.fromId(id)).toList(),
    );
  }

  //WARNING: EpisodeMinimum does not contain the podcast it is form, so the publisher and the podcastId of this Episode object are set to null.
  static Episode fromEpisodeMinimum(swagger.EpisodeMinimum episodeMinimum,
      String podcastPublisher, String podcastId, List<int> genreIds,
      {Duration position}) {

    List <int> genreIdsVar = genreIds ?? [];

    return new Episode(
        episodeMinimum.title ?? " ",
        episodeMinimum.id,
        episodeMinimum.audio,
        episodeMinimum.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
        Duration(seconds: episodeMinimum.audioLengthSec ?? 0),
        position ?? Duration(seconds: 0),
        podcastPublisher ?? " ",
        podcastId,
        episodeMinimum.description ?? " ",
        DateTime.fromMillisecondsSinceEpoch(episodeMinimum.pubDateMs ?? 0),
        genreIdsVar.map((id) => Genre.fromId(id)).toList());
  }

  static Episode fromEpisodeSearchResult(
      swagger.EpisodeSearchResult episodeSearchResult,
      {Duration position}) {

    List <int> genreIds = episodeSearchResult.podcast.genreIds ?? [];

    return new Episode(
        episodeSearchResult.titleOriginal ?? " ",
        episodeSearchResult.id,
        episodeSearchResult.audio,
        episodeSearchResult.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
        Duration(seconds: episodeSearchResult.audioLengthSec ?? 0),
        position ?? Duration(seconds: 0),
        episodeSearchResult.podcast.publisherOriginal ?? " ",
        episodeSearchResult.podcast.id,
        episodeSearchResult.descriptionOriginal ?? " ",
        DateTime.fromMillisecondsSinceEpoch(episodeSearchResult.pubDateMs ?? 0),
        genreIds.map((id) => Genre.fromId(id)).toList());
  }

  static Episode fromEpisodeSimple(swagger.EpisodeSimple episodeSimple, {Duration position}) {

    List<int> genreIds;
    api.getPodcast(episodeSimple.podcast.id).then((podcast) => genreIds = podcast.genreIds.toList() ?? []);

    return new Episode(
        episodeSimple.title ?? " ",
        episodeSimple.id,
        episodeSimple.audio,
        episodeSimple.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
        Duration(seconds: episodeSimple.audioLengthSec ?? 0),
        position ?? Duration(seconds: 0),
        episodeSimple.podcast.publisher ?? " ",
        episodeSimple.podcast.id,
        episodeSimple.description ?? " ",
        DateTime.fromMillisecondsSinceEpoch(episodeSimple.pubDateMs ?? 0),
        genreIds.map((id) => Genre.fromId(id)).toList()
    );
  }

  static Episode fromDatabaseMap(Map<String, dynamic> map) {
    Iterable l = json.decode(map[DatabaseHelper.genreIdsColumn]);
    List<Genre> genres =
        List<int>.from(l).map((id) => Genre.fromId(id)).toList();
    return Episode(
      map[DatabaseHelper.titleColumn],
      map[DatabaseHelper.idColumn],
      map[DatabaseHelper.audioColumn],
      map[DatabaseHelper.imageColumn],
      Duration(seconds: map[DatabaseHelper.durationColumn]),
      Duration(seconds: map[DatabaseHelper.positionColumn]),
      map[DatabaseHelper.publisherColumn],
      map[DatabaseHelper.podcastIdColumn],
      map[DatabaseHelper.descriptionColumn],
      DateTime.parse(map[DatabaseHelper.publishDateColumn]),
      genres,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseHelper.idColumn: id,
      DatabaseHelper.titleColumn: title,
      DatabaseHelper.audioColumn: audio,
      DatabaseHelper.imageColumn: imageUrl,
      DatabaseHelper.durationColumn: duration.inSeconds,
      DatabaseHelper.positionColumn: duration.inSeconds,
      DatabaseHelper.publisherColumn: publisher,
      DatabaseHelper.podcastIdColumn: podcastId,
      DatabaseHelper.descriptionColumn: description,
      DatabaseHelper.publishDateColumn: publishDate.toIso8601String(),
      DatabaseHelper.genreIdsColumn:
          jsonEncode(genres.map((genre) => genre.id).toList()),
    };
  }

  static Episode initialEpisode() {
    return Episode(
      "No currently playing episode.",
      "id",
      "audio",
      "https://www.searchpng.com/wp-content/uploads/2019/09/Android-Loading-Icon-PNG-Image.jpg",
      Duration(seconds: 0),
      Duration(seconds: 0),
      "Publisher",
      "podcastId",
      "description",
      DateTime.now(),
      [Genre.fromId(151)],
    );
  }
}
