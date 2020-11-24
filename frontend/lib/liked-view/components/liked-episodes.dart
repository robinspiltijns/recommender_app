import 'package:flutter/material.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/liked-view/components/liked-episode-card.dart';

class LikedEpisodesWidget extends StatelessWidget {

  final List<Episode> episodes;

  LikedEpisodesWidget(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your liked episodes",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        Column(
          children: episodes.map((episode) => LikedEpisodeCard(episode)).toList()
        )
      ]
    );
  }
}