import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';
import 'package:frontend/feed-view/components/episode-card.dart';
import 'package:frontend/object-model/episode.dart';

enum RecommendationBasis { PODCAST, EPISODE, GENRE }

class FeedViewSection extends StatelessWidget {
  double SECTION_HEIGHT;
  static const double SECTION_MARGIN_TOP = 10;
  static const int NB_CARDS_PER_SECTION = 8;

  Map<RecommendationBasis, String> sectionTitles = {
    RecommendationBasis.PODCAST: "Because you listened to ",
    RecommendationBasis.EPISODE: "Because you liked ",
    RecommendationBasis.GENRE: "Because you listen to podcasts of the genre "
  };

  FeedViewSection(
      {RecommendationBasis b, String recDescription, dynamic resList}) {
    //TODO: Check if dynamic type corresponds to the right type for the given basis. If not, throw an error.
    this.resultList = resList;
    this.basis = b;
    this.recommendationDescription = recDescription;
    if (b == RecommendationBasis.EPISODE) {
      this.SECTION_HEIGHT =
          EpisodeCardWidget.CARD_HEIGHT + 2 * EpisodeCardWidget.CARD_MARGIN + 40;
    } else {
        this.SECTION_HEIGHT =
            PodcastCardWidget.CARD_HEIGHT + 2 * PodcastCardWidget.CARD_MARGIN;
      }
  }

  dynamic resultList;
  RecommendationBasis basis;
  String recommendationDescription;

  List<Widget> generateCards(int nbCards) {
    List<Widget> result = [];

    int max = min(resultList.length, nbCards);

    if (basis == RecommendationBasis.EPISODE) {
      for (int i = 0; i < max; i++) {
        result.add(EpisodeCardWidget(resultList[i]));
      }
    } else {
      for (int i = 0; i < max; i++) {
        result.add(PodcastCardWidget(podcast: resultList[i]));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SECTION_HEIGHT + 80,
      child: Container(
        margin: EdgeInsets.only(top: SECTION_MARGIN_TOP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Text(
                sectionTitles[basis] + recommendationDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: SECTION_HEIGHT,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: generateCards(NB_CARDS_PER_SECTION),
                              ),
                            ),
                          ]),
                        ),
                      );
  }
}
