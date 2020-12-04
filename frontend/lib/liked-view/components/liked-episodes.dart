import 'package:flutter/material.dart';
import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/liked-view/components/liked-episode-card.dart';
import 'package:provider/provider.dart';

class LikedEpisodesWidget extends StatelessWidget {
  LikedEpisodesWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your liked episodes",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 10),
          Consumer<LikedEpisodesService>(
              builder: (context, likedEpisodesService, child) {
            return FutureBuilder(
              future: likedEpisodesService.getLikedEpisodes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var episodes = snapshot.data as List<Episode>;
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: episodes.length,
                    itemBuilder: (context, index) {
                      return LikedEpisodeCard(episodes[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(color: Color(0x26FFFFFF));
                    },
                  );
                } else {
                  // TODO: put loading indicator here
                  return Container();
                }
              },
            );
          }),
        ]));
  }
}
