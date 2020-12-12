import 'package:flutter/material.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:frontend/common/components/podcast-list-item.dart';
import 'package:swagger/api.dart';

class GenreDetailsBody extends StatelessWidget {

  final BestPodcastsResponse response;

  GenreDetailsBody(this.response);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 20),
        Text(response.name, style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 20),
        Text("Best podcasts", style: Theme.of(context).textTheme.headline2),
        SizedBox(height: 10),
        PodcastList(response.podcasts)
      ]

    );
  }

}

class PodcastList extends StatelessWidget {

  final List<PodcastSimple> podcasts;

  PodcastList(this.podcasts);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: podcasts.map(
              (PodcastSimple podcast) =>
                  PodcastListItem(Podcast.fromPodcastSimple(podcast))
      ).toList()
    );
  }
}