import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';

class PodcastDetailsBody extends StatelessWidget {
  final PodcastFull podcast;

  PodcastDetailsBody(this.podcast);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 30),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: CachedNetworkImageProvider(podcast.image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Text(podcast.title,
                  style: Theme.of(context).textTheme.podcastTitle),
              SizedBox(height: 5),
              Text(podcast.publisher,
                  style: Theme.of(context).textTheme.podcastProducer),
            ]),
          )
        ],
      ),
      Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(podcast.description,
                      style: Theme.of(context).textTheme.bodyText1)))),
      //Divider(
      //color: Theme.of(context).
      //)
    ]);
  }
}
