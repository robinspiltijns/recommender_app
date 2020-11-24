import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';
import 'package:swagger/api.dart';


enum RecommendationBasis {
  PODCAST,
  EPISODE,
  GENRE
}

class FeedViewSection extends StatelessWidget {

  static const double SECTION_HEIGHT = PodcastCardWidget.CARD_HEIGHT + 2*PodcastCardWidget.CARD_MARGIN;
  static const double SECTION_MARGIN_TOP = 10;

  Map<RecommendationBasis, String> sectionTitles = {
    RecommendationBasis.PODCAST : "Because you listened to ", 
    RecommendationBasis.EPISODE : "Because you liked ", 
    RecommendationBasis.GENRE : "Because you listen to podcasts of the genre "
  };

  FeedViewSection({RecommendationBasis b, String recDescription, dynamic resList}) {
    //TODO: Check if dynamic type corresponds to the right type for the given basis. If not, throw an error.
    this.resultList = resList;
    this.basis = b;
    this.recommendationDescription = recDescription;
  }

  dynamic resultList;
  RecommendationBasis basis;
  String recommendationDescription;


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: SECTION_MARGIN_TOP),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 40,
            child: Text(
              sectionTitles[basis] + recommendationDescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: SECTION_HEIGHT,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PodcastCardWidget(podcast: resultList[0],),
                PodcastCardWidget(podcast: resultList[1],),
                PodcastCardWidget(podcast: resultList[2],),
              ],
            ),
          )
        ],
      ),
    );
  }
}
