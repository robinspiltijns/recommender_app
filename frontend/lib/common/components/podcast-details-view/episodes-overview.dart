import 'package:flutter/cupertino.dart';
import 'package:frontend/common/components/episode-list-item.dart';
import 'package:frontend/object-model/episode.dart';

class EpisodesOverview extends StatelessWidget {

  final List<Episode> episodes;

  EpisodesOverview(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: episodes.map((episode) => EpisodeListItem(episode)).toList(),
      );
  }

}