import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/services/logging-service/logging-notification.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/common/utils.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/common/theme.dart';
import 'package:provider/provider.dart';

class EpisodeListItem extends StatelessWidget {
  final Episode episode;

  EpisodeListItem(this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).cardColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      child: Image(
                        image: NetworkImage(this.episode.imageUrl),
                        width: 40,
                        height: 40,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.episode.title,
                              style: Theme.of(context).textTheme.podcastTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              Utils.releaseDateDurationString(
                                  episode.publishDate,
                                  episode.duration.inSeconds
                              ),
                              style: Theme.of(context).textTheme.episodeDuration,
                            )
                          ]
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Consumer<PlayerService>(
                          builder: (context, playerService, child) {
                            if (playerService.isPlaying
                                && playerService.episode.id == episode.id) {
                              return CustomIconButton(
                                icon: Icons.pause,
                                onTap: () => playerService.pause()
                              );
                            }

                            return CustomIconButton(
                              icon: Icons.play_arrow,
                              onTap: () {
                                ActionNotification(
                                    LoggingAction.PLAY
                                ).dispatch(context);
                                playerService.play(episode);
                              }
                            );
                          }
                        ),
                        SizedBox(width: 10),
                        Consumer<QueueService>(
                          builder: (context, queueService, child) {
                            return CustomIconButton(
                                icon: Icons.queue,
                                onTap: () {
                                  ActionNotification(
                                    LoggingAction.QUEUE
                                  ).dispatch(context);
                                  queueService.addEpisode(episode);
                                }
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  Utils.removeAllHtmlTags(episode.description),
                  style: Theme.of(context).textTheme.description,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        )
    );
  }
}