import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:swagger/api.dart';


class EpisodeSearchResultCard extends StatelessWidget {

  static const double HEIGHT = CARD_HEIGHT + TOP_MARGIN + DESCRIPTION_TOP_MARGIN;

  static const double CARD_HEIGHT = 103;
  static const double LEFT_MARGIN = 10;
  static const double TOP_MARGIN = 10;

  static const double BUTTON_SIDE_WIDTH = 2*CustomIconButton.SQUARE_DIMENSIONS + 3*BUTTON_BETWEEN_SPACING;
  static const double BUTTON_BETWEEN_SPACING = 10;


  static const double DESCRIPTION_HEIGHT = 50;
  static const int NB_LINES_DESCRIPTION = 3;
  static const double DESCRIPTION_TOP_MARGIN = 10;


  EpisodeSearchResult episode;

  EpisodeSearchResultCard({EpisodeSearchResult ep}) {
    this.episode = ep;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: LEFT_MARGIN, top: TOP_MARGIN),
        height: CARD_HEIGHT,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded( //container with all the text (left side of card)
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container( // container with title
                              child: Text(episode.titleOriginal,
                                style: Theme.of(context).textTheme.episodeTitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container( // containter with duration
                              child: Text(durationString(episode.audioLengthSec),
                                  style: Theme.of(context).textTheme.episodeDuration),
                            ),
                            Container( // container with description
                                margin: EdgeInsets.only(top: DESCRIPTION_TOP_MARGIN),
                                height: DESCRIPTION_HEIGHT,
                                child: Text(episode.descriptionOriginal,
                                  style: Theme.of(context).textTheme.description,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: NB_LINES_DESCRIPTION,)
                            )
                          ])
                  ),
                  Container( // container with the buttons (right)
                    alignment: Alignment.topCenter,
                    width: BUTTON_SIDE_WIDTH,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(Icons.play_arrow_rounded),
                        SizedBox(
                          width: BUTTON_BETWEEN_SPACING,
                        ),
                        CustomIconButton(Icons.library_add_rounded)
                      ],
                    ),
                  ),
                ]
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Color(0xBAFFFFFF),
            )
          ],
        )
    );
  }

  String durationString(int secs) {
    String result = "";
    var duration = Duration(seconds: secs);
    if (duration.inHours > 0) {
      if (duration.inHours == 1) {
        result += "1 hr";
      } else {
        result += "${duration.inHours} hrs";
      }
    }

    if (duration.inMinutes.remainder(60) > 0) {
      if (duration.inMinutes.remainder(60) == 1) {
        result += "1 min";
      } else {
        result += "${duration.inMinutes.remainder(60)} mins";
      }
    }

    return result;
  }
}