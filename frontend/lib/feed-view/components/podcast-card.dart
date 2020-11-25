import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class PodcastCardWidget extends StatelessWidget {

  static const double CARD_WIDTH = 300;
  static const double CARD_HEIGHT = 150;
  static const double ARTWORK_DIM = CARD_HEIGHT*(1-DESCRIPTION_HEIGHT_RATIO) - 1.5*CARD_CONTENT_PADDING;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.55;
  static const double CARD_MARGIN = 10;

  PodcastCardWidget({PodcastSimple podcast}) {
    this.podcastTitle = podcast.title;
    this.podcastDescription = podcast.description;
    this.podcastArtworkURL = podcast.image;

  }

  String podcastDescription;
  String podcastTitle;
  String podcastArtworkURL;


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: CARD_MARGIN, right: CARD_MARGIN, bottom: CARD_MARGIN),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: CARD_WIDTH,
          height: CARD_HEIGHT,
          color: Color.fromRGBO(36, 39, 73, 100),
          child: Column(
            children: [
              Container(
                height: CARD_HEIGHT*(1-DESCRIPTION_HEIGHT_RATIO),
                padding: EdgeInsets.fromLTRB(CARD_CONTENT_PADDING, CARD_CONTENT_PADDING, CARD_CONTENT_PADDING, CARD_CONTENT_PADDING/2),
                child: Row(
                  children: [
                    ClipRRect(
                        child: Image(
                          image: NetworkImage(this.podcastArtworkURL),
                          width: ARTWORK_DIM,
                          height: ARTWORK_DIM,
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
                          ),
                        margin: EdgeInsets.only(left: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: CARD_HEIGHT*DESCRIPTION_HEIGHT_RATIO,
                padding: EdgeInsets.fromLTRB(CARD_CONTENT_PADDING, CARD_CONTENT_PADDING/2, CARD_CONTENT_PADDING, CARD_CONTENT_PADDING),
                  alignment: Alignment.center,
                  child: Text(
                    podcastDescription,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 4,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
