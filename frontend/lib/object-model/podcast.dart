import 'package:flutter/material.dart';
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
        result.titleOriginal ?? " ",
        result.descriptionOriginal ?? " ",
        result.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
        result.publisherOriginal ?? " "
    );
  }

  static Podcast fromPodcastSimple(PodcastSimple podcastSimple) {
    return Podcast(
      podcastSimple.id,
        podcastSimple.title ?? " ",
        podcastSimple.description ?? " ",
        podcastSimple.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80", //link to image of podcast microphone
        podcastSimple.publisher ?? " "
    );
  }

}