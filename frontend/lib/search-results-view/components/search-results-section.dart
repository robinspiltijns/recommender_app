import 'package:flutter/cupertino.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
import 'package:frontend/search-results-view/components/episode-search-result-card.dart';
import 'package:frontend/search-results-view/components/more-button.dart';
import 'package:swagger/api.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';

enum ResultType {
  EPISODES,
  PODCASTS
}

class SearchResultsSection extends StatefulWidget {

  static const double LEFT_MARGIN = 10;
  static const double MORE_PART_HEIGT = 20 + MoreButton.HEIGHT;
  static const double TITLE_PART_HEIGT = 50;
  static const int RESULTS_INCREASE_NB = 3;


  SearchResultsSection({List<dynamic> results, ResultType t, int nbRes, Function callbackFunction}) {
    this.episodes = results;
    this.type = t;
    this.nbResults = nbRes;
    this.callback = callbackFunction;
  }

  Function callback;
  int nbResults;
  List<dynamic> episodes;
  ResultType type;

  @override
  _SearchResultsSectionState createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection> {

  double SECTION_HEIGHT;
  double resultsPartHeight;
  int nbResults;

  List<Widget> res = [];

  @override
  void initState() {
    super.initState();
    this.nbResults = this.widget.nbResults;
    this.res = generateResultList();
    this.resultsPartHeight = EpisodeSearchResultCard.HEIGHT * this.nbResults;
    SECTION_HEIGHT = SearchResultsSection.TITLE_PART_HEIGT + resultsPartHeight + SearchResultsSection.MORE_PART_HEIGT + 40;
  }


  showMore() {
    print("widget: " + this.widget.toStringShort());
    this.widget.callback(SearchResultsSection(nbRes: nbResults + SearchResultsSection.RESULTS_INCREASE_NB, t: this.widget.type, callbackFunction: this.widget.callback,), this.widget.type);
    print("shows " + nbResults.toString() + " results");
  }

  List<Widget> generateResultList() {
    List<Widget> list = [];
    for (int i=0;i<nbResults;i++) {
      if (i >= 9) {
        list.add(Text("No more results to show",
        style: TextStyle(color: Colors.white),));
        break;
      }
      list.add(EpisodeSearchResultCard(ep: this.widget.episodes[i]));
    }
    return list;
  }

  updateDimensionConstants() {
    this.nbResults += SearchResultsSection.RESULTS_INCREASE_NB;
    resultsPartHeight = EpisodeSearchResultCard.HEIGHT * nbResults;
    SECTION_HEIGHT = SearchResultsSection.TITLE_PART_HEIGT + resultsPartHeight + SearchResultsSection.MORE_PART_HEIGT + 40;
  }

  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SECTION_HEIGHT,
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
                height: resultsPartHeight,
                child: ListView(
                  children: res,
                ),
              ),
              Container(
                height: SearchResultsSection.MORE_PART_HEIGT,
                child: FlatButton(
                    child: MoreButton(),
                onPressed: showMore,)
              )
            ],
          ),
        );
  }
}