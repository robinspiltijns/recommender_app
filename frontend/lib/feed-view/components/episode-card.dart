import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class EpisodeCardWidget extends StatelessWidget {
  static const double CARD_WIDTH = 317;
  static const double CARD_HEIGHT = 98;
  static const double ARTWORK_DIM = CARD_HEIGHT * 3/7;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.5;
  static const double CARD_MARGIN = 10;

  EpisodeCardWidget({EpisodeSimple episode}) {
    this.episodeTitle = episode.title;
    this.episodeDescription = episode.description;
    this.episodeArtworkURL = episode.image;
    this.episodeId = episode.id;
  }

  String episodeDescription;
  String episodeTitle;
  String episodeArtworkURL;
  String episodeId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: CARD_MARGIN, right: CARD_MARGIN, bottom: CARD_MARGIN),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromRGBO(36, 39, 73, 100),
        ),
        width: CARD_WIDTH,
        height: CARD_HEIGHT,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.pushNamed(
                context,
                "/details",
                arguments: episodeId);
          },
          child: Column(
            children: [
              Container(
                height: CARD_HEIGHT * (1 - DESCRIPTION_HEIGHT_RATIO),
                padding: EdgeInsets.fromLTRB(
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
                    Flexible(
                      child: Container(
                        child: Text(
                          episodeTitle,
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
                  height: CARD_HEIGHT * DESCRIPTION_HEIGHT_RATIO,
                  padding: EdgeInsets.fromLTRB(
                      CARD_CONTENT_PADDING,
                      CARD_CONTENT_PADDING / 2,
                      CARD_CONTENT_PADDING,
                      CARD_CONTENT_PADDING),
                  alignment: Alignment.center,
                  child: Text(
                    episodeDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 4,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
