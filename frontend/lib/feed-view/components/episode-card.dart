import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/utils.dart';
import 'package:intl/intl.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';


class EpisodeCardWidget extends StatelessWidget {
  static const double CARD_WIDTH = 317;
  static const double CARD_HEIGHT = 115;
  static const double ARTWORK_DIM = 50;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.45;
  static const double CARD_MARGIN = 10;

  EpisodeCardWidget({EpisodeSimple episode}) {
    this.episodeTitle = removeAllHtmlTags(episode.title);
    this.episodeDescription = removeAllHtmlTags(episode.description);
    this.episodeArtworkURL = episode.image;
    this.episodeId = episode.id;
    this.duration = durationString(episode.audioLengthSec);
  }

  String episodeDescription;
  String episodeTitle;
  String episodeArtworkURL;
  String episodeId;
  String duration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context,
            "/details",
            arguments: episodeId);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: CARD_MARGIN, right: CARD_MARGIN, bottom: CARD_MARGIN),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromRGBO(36, 39, 73, 100),
          ),
          width: CARD_WIDTH,
          height: CARD_HEIGHT,
          child: Column(
            children: [
              Container( // artwork + title
                height: CARD_HEIGHT * (1 - DESCRIPTION_HEIGHT_RATIO) - CARD_MARGIN,
                margin: EdgeInsets.fromLTRB(
                    CARD_CONTENT_PADDING,
                    CARD_CONTENT_PADDING,
                    CARD_CONTENT_PADDING,
                    CARD_CONTENT_PADDING / 2),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image(
                        image: NetworkImage(this.episodeArtworkURL),
                        width: ARTWORK_DIM,
                        height: ARTWORK_DIM,
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    Expanded( // title + duration
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              episodeTitle,
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
                              duration,
                              style: Theme.of(context).textTheme.episodeDuration,
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
                height: CARD_HEIGHT * DESCRIPTION_HEIGHT_RATIO - CARD_MARGIN,
                margin: EdgeInsets.fromLTRB(
                    CARD_CONTENT_PADDING,
                    CARD_CONTENT_PADDING / 2,
                    CARD_CONTENT_PADDING,
                    CARD_CONTENT_PADDING),
                child: Text(
                  episodeDescription,
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
}
