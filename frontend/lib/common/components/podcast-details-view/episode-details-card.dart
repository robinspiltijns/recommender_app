import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';

import '../../utils.dart';

class EpisodeDetailsCard extends StatelessWidget {
  final EpisodeMinimum episode;

  EpisodeDetailsCard(this.episode);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(episode.title,
                      style: Theme.of(context).textTheme.episodeTitle),
                ),


                Text(
                    releaseDateDurationString(
                        episode.pubDateMs, episode.audioLengthSec),
                    style: Theme.of(context).textTheme.episodeDuration),
                SizedBox(height: 10),
                Text(
                    removeAllHtmlTags(episode.description),
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3
                ),
              ])
      ]
    );

  }

  String releaseDateDurationString(int pubDateMs, int audioLengthSec) {
    var dateTime = new DateTime.fromMillisecondsSinceEpoch(pubDateMs);
    return DateFormat.yMMMMd('en_US').format(dateTime) +
        " - " +
        Utils.durationString(Duration(seconds: audioLengthSec));
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}
