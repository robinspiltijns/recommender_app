import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';

import '../../utils.dart';

class EpisodeDetailsCard extends StatelessWidget {
  final EpisodeMinimum episode;

  EpisodeDetailsCard(this.episode);

  IconData _getPlayButtonIcon(bool isPlayingAudio, String episodeId) {
    return isPlayingAudio && episode.id == episodeId
        ? Icons.pause
        : Icons.play_arrow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(episode.title,
                      style: Theme.of(context).textTheme.episodeTitle),
                  Text(
                      releaseDateDurationString(
                          episode.pubDateMs, episode.audioLengthSec),
                      style: Theme.of(context).textTheme.episodeDuration),
                  SizedBox(height: 10),
                  ExpandableText(
                    removeAllHtmlTags(episode.description),
                    style: Theme.of(context).textTheme.bodyText2,
                    expandText: "Show more",
                    collapseText: "Show less",
                    maxLines: 3,
                    linkColor: Colors.white,
                  )
                ])),
            SizedBox(width: 10),
            Row(
              children: [
                Consumer<PlayerService>(
                    builder: (context, playerService, child) {
                  return CustomIconButton(
                      icon: _getPlayButtonIcon(
                          playerService.isPlaying, playerService.episodeId),
                      onTap: () => playerService.play(episode.id));
                }),
                SizedBox(width: 10),
                CustomIconButton(icon: Icons.queue, onTap: () => {})
              ],
            )
          ],
        ));
  }

  String releaseDateDurationString(int pubDateMs, int audioLengthSec) {
    var dateTime = new DateTime.fromMillisecondsSinceEpoch(pubDateMs);
    return DateFormat.yMMMMd('en_US').format(dateTime) +
        " - " +
        Utils.durationString(Duration(seconds: audioLengthSec));
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
