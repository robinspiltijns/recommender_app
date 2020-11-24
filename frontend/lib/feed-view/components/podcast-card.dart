import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class PodcastCardWidget extends StatelessWidget {

  static const double CARD_WIDTH = 300;
  static const double CARD_HEIGHT = 150;
  static const double ARTWORK_DIM = CARD_HEIGHT*(1-DESCRIPTION_HEIGHT_RATIO) - 1.5*CARD_CONTENT_PADDING;
  static const double CARD_CONTENT_PADDING = 10;
  static const double DESCRIPTION_HEIGHT_RATIO = 0.55;

  PodcastCardWidget(/*{PodcastSimple podcast}*/) {
    this.podcastTitle = "Title of podcast";
    this.podcastDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    this.podcastArtworkURL = "https://images.unsplash.com/photo-1587675213549-82cd6379ee42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";

  }

  String podcastDescription;
  String podcastTitle;
  String podcastArtworkURL;


  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
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
    );
  }
}
