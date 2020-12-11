import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:swagger/api.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final api = DefaultApi();

  Future<dynamic> futureResp;

  List<Map<String, dynamic>> sections = [
    {
      "basis": RecommendationBasis.PODCAST,
      "id": "4d3fe717742d4963a85562e9f84d8c79",
      "sectionTitleDescription": "Star Wars"
    },
    {
      "basis": RecommendationBasis.EPISODE,
      "id": "02f0123246c944e289ee2bb90804e41b",
      "sectionTitleDescription": "1,775: Happy 75th Birthday, George Lucas!"
    }
  ];

  @override
  void initState() {
    super.initState();
    makeFutures();
  }

  List<Future<Map<String, dynamic>>> futures;

  makeFutures() async {
    for (var index = 0; index < sections.length; index++) {
      if (sections[index]["basis"] == RecommendationBasis.PODCAST) {
        await addPodcastSection(index);
      } else if (sections[index]["basis"] == RecommendationBasis.EPISODE) {
        await addEpisodeSection(index);
      }
    }
  }

  addPodcastSection(int entryIndex) async {
    sections[entryIndex]["recommendations"] =
        api.getPodcastRecommendationsBasedOnPodcast(sections[entryIndex]["id"]);
  }

  addEpisodeSection(int entryIndex) async {
    sections[entryIndex]["recommendations"] =
        api.getEpisodeRecommendationsBasedOnEpisode(sections[entryIndex]["id"]);
  }

  List<Widget> generateSections() {
    List<Widget> result = [];
    for (var section in sections) {
      result.add(FutureBuilder<dynamic>(
          future: section["recommendations"],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var res = snapshot.data;
              return FeedViewSection(
                b: section["basis"],
                recDescription: section["sectionTitleDescription"],
                resList: res.recommendations,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Text("loading...");
          }));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed", style: Theme.of(context).textTheme.headline6),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: false,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: generateSections(),
          ),
        ]));
  }
}
