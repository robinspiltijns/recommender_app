import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/common/utils.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:provider/provider.dart';

class LikedEpisodeCard extends StatelessWidget {
  final Episode episode;

  LikedEpisodeCard(this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 58,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CachedNetworkImage(
            imageUrl: episode.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider),
              ),
            ),
            placeholder: (context, url) =>
                Container(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      episode.title,
                      style: Theme.of(context).textTheme.episodeTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(Utils.durationString(episode.duration),
                          style: Theme.of(context).textTheme.episodeDuration))
            ]))),
          SizedBox(width: 10),
          CustomIconButton(
              icon: Icons.more_horiz,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: buildModalBottomSheet(context),
                  useRootNavigator: true,
                  backgroundColor: Colors.transparent,
                );
              }),
          SizedBox(width: 10),
          CustomTextButton("More like this"),
        ]));
  }

  WidgetBuilder buildModalBottomSheet(BuildContext context) {
    return (context) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).backgroundColor,
            ),
            child: Row(children: [
              CachedNetworkImage(
                imageUrl: episode.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
                placeholder: (context, url) =>
                    Container(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          episode.title,
                          style: Theme.of(context).textTheme.episodeTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(Utils.durationString(episode.duration),
                              style: Theme.of(context).textTheme.episodeDuration)
                      )
                    ]
                  )
                )
              ),
            ]
            )
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Consumer<PlayerService>(
                  builder: (context, playerService, child) {
                    if (playerService.episode.id == episode.id) {
                      return InkWell(
                        onTap: () {
                          playerService.seek(Duration(seconds: 0));
                          if (!playerService.isPlaying) {
                            playerService.play(episode);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              color: Theme.of(context).buttonColor,
                            ),
                            child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text("Play from start", style: Theme.of(context).textTheme.actionText),
                                  Spacer(),
                                  Icon(Icons.replay, color: Colors.white),
                                  SizedBox(width: 20),
                                ]
                            )
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        playerService.play(episode);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          color: Theme.of(context).buttonColor,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Text("Play now", style: Theme.of(context).textTheme.actionText),
                            Spacer(),
                            Icon(Icons.play_arrow, color: Colors.white),
                            SizedBox(width: 20),
                          ]
                        )
                      ),
                    );
                  }
                ),
              Divider(thickness: 2, height: 2, color: Theme.of(context).backgroundColor),
              Consumer<QueueService>(
                builder: (context, queueService, child) =>
                  InkWell(
                    onTap: () {
                      queueService.insertQueuedEpisode(episode);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Text("Add to queue", style: Theme.of(context).textTheme.actionText),
                          Spacer(),
                          Icon(Icons.queue, color: Colors.white),
                          SizedBox(width: 20),
                        ]
                      )
                    ),
                  ),
              ),
              Divider(thickness: 2, height: 2, color: Theme.of(context).backgroundColor),
              Consumer<LikedEpisodesService>(
                builder: (context, likedEpisodesService, child) {
                  return InkWell(
                    onTap: () {
                        likedEpisodesService.deleteLikedEpisode(episode.id);
                        Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        color: Theme.of(context).buttonColor,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Text("Unfavourite", style: Theme.of(context).textTheme.actionText),
                          Spacer(),
                          Icon(Icons.favorite_border, color: Colors.white),
                          SizedBox(width: 20),
                        ]
                      )
                    )
                  );
                }
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: Center(
                    child: Text("Cancel", style: Theme.of(context).textTheme.actionText),
                  )
                ),
              ),
              SizedBox(height: 30)
            ]
          )
          )
        ]
      );
    }
}
