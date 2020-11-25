import 'package:flutter/material.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/liked-view/components/liked-episode-card.dart';

class LikedEpisodesWidget extends StatelessWidget {

  final List<Episode> episodes;

  LikedEpisodesWidget(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your liked episodes",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 10),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return LikedEpisodeCard(episodes[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Color(0x26FFFFFF),
              );
            },
          )
        ]
      )
    );
  }
}