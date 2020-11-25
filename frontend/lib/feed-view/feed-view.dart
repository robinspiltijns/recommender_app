import 'package:flutter/cupertino.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';
import 'package:swagger/api.dart';

class FeedWidget extends StatefulWidget {
  
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final api = DefaultApi();

  Future<GetPodcastRecommendationsResponse> futureResp;

  List<Map<String, dynamic>> sections = [
    {"basis" : RecommendationBasis.PODCAST, "id" : "4d3fe717742d4963a85562e9f84d8c79", "sectionTitleDescription" : "Star Wars"},
    {"basis" : RecommendationBasis.PODCAST, "id" : "c463d5980b8e480fb78db6b3ed6be115", "sectionTitleDescription" : "Maed in India"}
  ];

  @override
  void initState() {
    super.initState();
    makeFutures();
  }

  List<Future<Map<String, dynamic>>> futures;

   makeFutures() async {
    List<Map<String, dynamic>> result;
    for (var index = 0; index <sections.length; index++) {
      if (sections[index]["basis"] == RecommendationBasis.PODCAST) {
        await AddSection(index);
      }
    };
  }

  AddSection(int entryIndex) async {
     sections[entryIndex]["recommendations"] = api.getPodcastRecommendationsBasedOnPodcast(sections[entryIndex]["id"]);
  }

  List<Widget> generateSections() {
     List<Widget> result = [];
     for (var section in sections) {
       result.add(FutureBuilder<GetPodcastRecommendationsResponse>(
           future: section["recommendations"],
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               if (snapshot.data.runtimeType == GetPodcastRecommendationsResponse) {
                 var res = snapshot.data as GetPodcastRecommendationsResponse;
                 return FeedViewSection(b: section["basis"], recDescription: section["sectionTitleDescription"], resList: res.recommendations,);
               }
             } else if (snapshot.hasError) {
               return Text("${snapshot.error}");
             }

             // By default, show a loading spinner.
             return Text("loading...");
           }
       ));
     }
     return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: generateSections()

    /*[
          FutureBuilder<GetPodcastRecommendationsResponse>(
          future: sections[0]["recommendations"],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.runtimeType == GetPodcastRecommendationsResponse) {
                  var res = snapshot.data as GetPodcastRecommendationsResponse;
                  return FeedViewSection(b: sections[0]["basis"], recDescription: sections[0]["sectionTitleDescription"], resList: res.recommendations,);
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Text("loading...");
            },
          )
          ]*/,
        ));
  }
}