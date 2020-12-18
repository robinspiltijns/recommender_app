import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/user-name-service.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';

class FeedWidget extends StatefulWidget {
  
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final api = DefaultApi();

  Future<dynamic> futureResp;
  Future<String> name;

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
    },
    {
      "basis" : RecommendationBasis.GENRE,
      "id": "144",
      "sectionTitleDescription" : "Personal Finance"
    }
  ];

  @override
  void initState() {
    super.initState();
    makeFutures();
  }

   setTitle(UserNameService userNameService) {
    name = userNameService.getUserName();
  }


  List<Future<Map<String, dynamic>>> futures;

   makeFutures() async {
    for (var index = 0; index <sections.length; index++) {
      if (sections[index]["basis"] == RecommendationBasis.EPISODE) {
        await addEpisodeSection(index);
      } else {
        await addPodcastSection(index, sections[index]["basis"]);
      }
    }
  }

  addPodcastSection(int entryIndex, RecommendationBasis basis) async {
     if (basis == RecommendationBasis.PODCAST) {
       sections[entryIndex]["recommendations"] = api.getPodcastRecommendationsBasedOnPodcast(sections[entryIndex]["id"]);
     } else if (basis == RecommendationBasis.GENRE) {
       sections[entryIndex]["recommendations"] = api.getBestOfGenre(sections[entryIndex]["id"]);
     }
     }


  addEpisodeSection(int entryIndex) async {
    sections[entryIndex]["recommendations"] =
        api.getEpisodeRecommendationsBasedOnEpisode(sections[entryIndex]["id"]);
  }

  Widget generateSections(int index) {
    Map section = sections[index];
    return FutureBuilder<dynamic> (
           future: section["recommendations"],
           builder: (context, snapshot) {
             if (snapshot.hasData) {
                 var res = snapshot.data;
                 if (section["basis"] == RecommendationBasis.GENRE) {
                 return FeedViewSection(b: section["basis"], recDescription: section["sectionTitleDescription"], resList: res.podcasts,);
                 } else {
                 return FeedViewSection(b: section["basis"], recDescription: section["sectionTitleDescription"], resList: res.recommendations,);
                 }
             } else if (snapshot.hasError) {
               return Text("${snapshot.error}");
             }

             // By default, show a loading spinner.
             return Text("loading...");
           }
       );
   }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Consumer<UserNameService>(
         builder: (context, userNameService, child) {
           setTitle(userNameService);
           return FutureBuilder<String>(
             future: name,
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 return Text("Hi " + snapshot.data,
                     style: Theme
                         .of(context)
                         .textTheme
                         .headline6
                 );
               }
              else if (snapshot.hasError) {
                return Text("Hi ");
              }

              // By default, show a loading spinner.
              return Text("loading...");
              }
           );},
         ),
         backgroundColor: Colors.transparent,
         shadowColor: Colors.transparent,
         centerTitle: false,
       ),
       body:  SizedBox(
         height: sections.length * PodcastCardWidget.CARD_HEIGHT,
         child: ListView.builder(
           itemCount: sections.length,
           shrinkWrap: true,
           itemBuilder: (BuildContext context, int index) {
              return generateSections(index);
           },
         ),
       )
     );
  }
}