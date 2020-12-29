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

    var title = result.titleOriginal ?? " ";
    var description = result.descriptionOriginal ?? " ";
    var image_url = result.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80"; //link to image of podcast microphone
    var publisher = result.publisherOriginal ?? " ";

    return Podcast(
      result.id,
      title,
      description,
      image_url,
      publisher
    );
  }

  static Podcast fromPodcastSimple(PodcastSimple podcastSimple) {
    var title = podcastSimple.title ?? " ";
    var description = podcastSimple.description ?? " ";
    var image_url = podcastSimple.image ?? "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80"; //link to image of podcast microphone
    var publisher = podcastSimple.publisher ?? " ";
    return Podcast(
      podcastSimple.id,
      title,
      description,
      image_url,
      publisher
    );
  }

}