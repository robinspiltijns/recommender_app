import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';
import 'package:frontend/feed-view/components/episode-card.dart';
import 'package:frontend/feed-view/recommendations/recommendation-section-data.dart';
import 'package:swagger/api.dart';

class FeedViewSection extends StatelessWidget {
  final RecommendationSectionData sectionData;

  static const double SECTION_MARGIN_TOP = 10;
  static const int NB_CARDS_PER_SECTION = 8;

  FeedViewSection({this.sectionData});

  double get sectionHeight {
    if (sectionData.contentType == RecommendationSectionContentType.EPISODES) {
      return EpisodeCardWidget.CARD_HEIGHT +
          2 * EpisodeCardWidget.CARD_MARGIN +
          10;
    } else {
      return PodcastCardWidget.CARD_HEIGHT + 2 * PodcastCardWidget.CARD_MARGIN;
    }
  }

  String get sectionTitle {
    switch (sectionData.basisType) {
      case RecommendationSectionBasisType.FREQUENTGENRES:
        return "More about ${sectionData.basisTitle}";
      case RecommendationSectionBasisType.LASTPLAYEDEPISODES:
        return "Because you listened to ${sectionData.basisTitle}";
      case RecommendationSectionBasisType.LASTPLAYEDPODCASTS:
        return "Podcasts like ${sectionData.basisTitle}";
      case RecommendationSectionBasisType.POPULAR:
        return "Some popular podcasts";
      case RecommendationSectionBasisType.LIKED:
        return "Because you liked the episode ${sectionData.basisTitle}";
      case RecommendationSectionBasisType.INITIALGENRE:
        return "Because you liked the genre ${sectionData.basisTitle}";
    }
    return "For you";
  }

  List<Widget> generateCards(int nbCards) {
    List<Widget> result = [];
    int max;
    switch (sectionData.contentType) {
      case RecommendationSectionContentType.PODCASTS:
        List<PodcastSimple> recommendations =
            sectionData.podcastRecommendations;
        max = min(recommendations.length, nbCards);
        for (int i = 0; i < max; i++) {
          result.add(PodcastCardWidget(podcast: recommendations[i]));
        }
        break;
      case RecommendationSectionContentType.EPISODES:
        List<EpisodeSimple> recommendations =
            sectionData.episodeRecommendations;
        max = min(recommendations.length, nbCards);
        for (int i = 0; i < max; i++) {
          result.add(EpisodeCardWidget(recommendations[i]));
        }
        break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeight + 80,
      child: Container(
        margin: EdgeInsets.only(top: SECTION_MARGIN_TOP),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Text(
              sectionTitle,
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
            height: sectionHeight,
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
