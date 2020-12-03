import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:swagger/api.dart';


class PodcastSearchResultCard extends StatelessWidget {

  static const double HEIGHT = CARD_HEIGHT + TOP_MARGIN + DESCRIPTION_TOP_MARGIN ;

  static const double CARD_HEIGHT = 103;
  static const double LEFT_MARGIN = 10;
  static const double TOP_MARGIN = 10;

  static const double DESCRIPTION_HEIGHT_RATIO = 0.6;
  static const double ARTWORK_DIM = 40;


  static const int NB_LINES_DESCRIPTION = 2;
  static const double DESCRIPTION_TOP_MARGIN = 10;


  PodcastSearchResult podcast;

  PodcastSearchResultCard(PodcastSearchResult pc) {
    this.podcast = pc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: LEFT_MARGIN),
      child: Container(
        height: HEIGHT,
        child: Column(
          children: [
            Container(
              height: CARD_HEIGHT*(1-DESCRIPTION_HEIGHT_RATIO),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image(
                      image: NetworkImage(this.podcast.image),
                      width: ARTWORK_DIM,
                      height: ARTWORK_DIM,
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  Flexible(
                    child: Container(
                      child: Text(
                        this.podcast.titleOriginal,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: CARD_HEIGHT*DESCRIPTION_HEIGHT_RATIO,
                alignment: Alignment.center,
                child: Text(
                  this.podcast.descriptionOriginal,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: NB_LINES_DESCRIPTION,
                )
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Color(0xBAFFFFFF),
            )
          ],
        ),
      ),
    );
  }
}