import 'package:flutter/cupertino.dart';
import 'package:swagger/api.dart';

import 'episode-details-card.dart';

class EpisodesOverview extends StatelessWidget {

  final List<EpisodeMinimum> episodes;

  EpisodesOverview(this.episodes);

  @override
  Widget build(BuildContext context) {
    return EpisodeDetailsCard(episodes[0]);
  }

}