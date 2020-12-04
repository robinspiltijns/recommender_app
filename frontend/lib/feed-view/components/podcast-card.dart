import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class PodcastCardWidget extends StatelessWidget {
  static const double CARD_WIDTH = 200;
  static const double CARD_HEIGHT = 201;
  static const double ARTWORK_DIM = 50;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.55;
  static const double CARD_MARGIN = 10;

  static const double TITLE_PART_HEIGHT = ARTWORK_DIM + 20;

  static const int MAX_LINES_TITLE = 2;
  static const int MAX_LINES_DESCRIPTION = 7;

  PodcastCardWidget({PodcastSimple podcast}) {
    this.podcastTitle = podcast.title;
    this.podcastDescription = podcast.description;
    this.podcastArtworkURL = podcast.image;
    this.podcastId = podcast.id;
  }

  String podcastDescription;
  String podcastTitle;
  String podcastArtworkURL;
  String podcastId;

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
                arguments: podcastId);
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
                    Container(
                      height: TITLE_PART_HEIGHT,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: ClipRRect(
                        child: Image(
                          image: NetworkImage(this.podcastArtworkURL),
                          width: ARTWORK_DIM,
                          height: ARTWORK_DIM,
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          podcastTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: MAX_LINES_TITLE,
                        ),
                        margin: EdgeInsets.only(left: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(
                        CARD_CONTENT_PADDING,
                        CARD_CONTENT_PADDING / 2,
                        CARD_CONTENT_PADDING,
                        CARD_CONTENT_PADDING),
                    alignment: Alignment.topCenter,
                    child: Text(
                      podcastDescription,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: MAX_LINES_DESCRIPTION,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
