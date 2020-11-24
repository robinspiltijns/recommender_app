import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class PodcastCardWidget extends StatelessWidget {

  PodcastCardWidget({PodcastSimple podcast}) {
    this.podcastTitle = podcast.title;
    this.podcastDescription = podcast.description;
    this.podcastArtwork = Image(image: NetworkImage(podcast.image));
  }

  String podcastDescription;
  String podcastTitle;
  Image podcastArtwork;


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200,
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              podcastArtwork,
              Text(podcastTitle),
            ],
          ),
          Text(podcastDescription)
        ],
      ),
    );
  }
}
