import 'package:flutter/cupertino.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:swagger/api.dart';

import 'episode-details-card.dart';

class EpisodesOverview extends StatelessWidget {

  final List<Episode> episodes;

  EpisodesOverview(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: episodes.map((episode) => EpisodeDetailsCard(episode)).toList(),
      );
  }

}