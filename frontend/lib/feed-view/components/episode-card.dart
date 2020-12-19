import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/common/utils.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';
import 'package:swagger/api.dart';

class EpisodeCardWidget extends StatelessWidget {
  static const double CARD_WIDTH = 325;
  static const double CARD_HEIGHT = 115;
  static const double ARTWORK_DIM = 50;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.45;
  static const double CARD_MARGIN = 10;

  static const double BUTTON_PART_WIDTH = 55;
  static const double VERT_SPACE_BETWEEN_BUTTONS = 20;

  EpisodeCardWidget(this.episodeSimple);

  EpisodeSimple episodeSimple;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: CARD_MARGIN, right: CARD_MARGIN, bottom: CARD_MARGIN),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            width: CARD_WIDTH,
            height: CARD_HEIGHT,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        // artwork + title
                        height: CARD_HEIGHT * (1 - DESCRIPTION_HEIGHT_RATIO) -
                            CARD_MARGIN,
                        margin: EdgeInsets.fromLTRB(
                            CARD_CONTENT_PADDING,
                            CARD_CONTENT_PADDING,
                            CARD_CONTENT_PADDING,
                            CARD_CONTENT_PADDING / 2),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image(
                                image: NetworkImage(episodeSimple.image),
                                width: ARTWORK_DIM,
                                height: ARTWORK_DIM,
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            Expanded(
                              // title + duration
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      removeAllHtmlTags(episodeSimple.title),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    Text(
                                      durationString(
                                          episodeSimple.audioLengthSec),
                                      style: Theme.of(context)
                                          .textTheme
                                          .episodeDuration,
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(left: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: CARD_HEIGHT * DESCRIPTION_HEIGHT_RATIO -
                            CARD_MARGIN + 5,
                        margin: EdgeInsets.fromLTRB(
                            CARD_CONTENT_PADDING,
                            CARD_CONTENT_PADDING / 2,
                            CARD_CONTENT_PADDING,
                            CARD_CONTENT_PADDING),
                        child: Text(
                          removeAllHtmlTags(episodeSimple.description),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color.fromRGBO(255, 255, 255, 0.05),
                  width: BUTTON_PART_WIDTH,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<QueueService>(
                          builder: (context, queueService, child) {
                        return CustomIconButton(
                          icon: Icons.library_add_rounded,
                          onTap: () {
                            queueEpisode(episodeSimple.id, queueService);
                          },
                        );
                      }),
                      SizedBox(height: VERT_SPACE_BETWEEN_BUTTONS),
                      CustomIconButton(
                          icon: Icons.play_arrow_rounded, onTap: null)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

  String durationString(int audioLengthSec) {
    return Utils.durationString(Duration(seconds: audioLengthSec));
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  queueEpisode(String id, QueueService queueService) async {
    EpisodeFull episode = await DefaultApi().getEpisode(id);
    queueService.addEpisode(Episode.fromEpisodeFull(episode));
  }
}
