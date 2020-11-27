import 'package:flutter/cupertino.dart';
import 'package:frontend/search-results-view/components/episode-search-result-card.dart';
import 'package:swagger/api.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

enum ResultType {
  EPISODES,
  PODCASTS
}

class SearchResultsSection extends StatefulWidget {

  static const double SECTION_HEIGHT = TITLE_PART_HEIGT + RESULTS_PART_HEIGHT + MORE_PART_HEIGT;
  static const double LEFT_MARGIN = 10;
  static const double MORE_PART_HEIGT = 50;
  static const double TITLE_PART_HEIGT = 50;
  static const double RESULTS_PART_HEIGHT = 200;


  SearchResultsSection({List<dynamic> results, ResultType t}) {
    this.episodes = results;
    this.type = t;
  }

  List<dynamic> episodes;
  ResultType type;

  @override
  _SearchResultsSectionState createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection> {

  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SearchResultsSection.SECTION_HEIGHT,
          child: Column(
            children: [
              Container(
                height: SearchResultsSection.TITLE_PART_HEIGT,
                alignment: AlignmentDirectional.centerStart,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  titles[this.widget.type],
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Container(
                height: SearchResultsSection.RESULTS_PART_HEIGHT,
                child: ListView(
                  children: [
                    EpisodeSearchResultCard(ep: this.widget.episodes[0]),
                  ],
                ),
              ),
              Container(
                height: SearchResultsSection.MORE_PART_HEIGT,
                child: Text("more", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        );
  }
}