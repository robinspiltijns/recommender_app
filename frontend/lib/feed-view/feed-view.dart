import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/user-name-service.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:frontend/feed-view/reccomendation-section-data.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {

  bool _loaded = false;

  final api = DefaultApi();

  Future<dynamic> futureResp;
  Future<String> name;

  List<RecommendationSectionData> recommendationSectionsData = [
    RecommendationSectionData(
        basis: ContentType.PODCAST,
        id: "4d3fe717742d4963a85562e9f84d8c79",
        description: "Star Wars"),
    RecommendationSectionData(
        basis: ContentType.EPISODE,
        id: "02f0123246c944e289ee2bb90804e41b",
        description: "1,775: Happy 75th Birthday, George Lucas!"),
    RecommendationSectionData(
        basis: ContentType.GENRE, id: "144", description: "Personal Finance"),
  ];

  @override
  void initState() {
    super.initState();
    _loadRecommendations();
    makeFutures();
    _loadRecommendations();
  }

  _loadRecommendations() {

  }

  setTitle(UserNameService userNameService) {
    name = userNameService.getUserName();
  }

  List<Future<Map<String, dynamic>>> futures;

  makeFutures() async {
    for (var index = 0; index < recommendationSectionsData.length; index++) {
      if (recommendationSectionsData[index].basis == ContentType.EPISODE) {
        await addEpisodeSection(index);
      } else {
        await addPodcastSection(index, recommendationSectionsData[index].basis);
      }
    }
  }

  addPodcastSection(int entryIndex, ContentType basis) async {
    if (basis == ContentType.PODCAST) {
      recommendationSectionsData[entryIndex].recommendations =
          api.getPodcastRecommendationsBasedOnPodcast(
              recommendationSectionsData[entryIndex].id);
    } else if (basis == ContentType.GENRE) {
      recommendationSectionsData[entryIndex].recommendations =
          api.getBestOfGenre(recommendationSectionsData[entryIndex].id);
    }
  }

  addEpisodeSection(int entryIndex) async {
    recommendationSectionsData[entryIndex].recommendations =
        api.getEpisodeRecommendationsBasedOnEpisode(
            recommendationSectionsData[entryIndex].id);
  }

  Widget generateSection(RecommendationSectionData sectionData) {
    return FutureBuilder<dynamic>(
        future: sectionData.recommendations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var res = snapshot.data;
            if (sectionData.basis == ContentType.GENRE) {
              return FeedViewSection(
                b: sectionData.basis,
                recDescription: sectionData.description,
                resList: res.podcasts,
              );
            } else {
              return FeedViewSection(
                b: sectionData.basis,
                recDescription: sectionData.description,
                resList: res.recommendations,
              );
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Text("loading...");
        });
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
                          style: Theme.of(context).textTheme.headline6);
                    } else if (snapshot.hasError) {
                      return Text("Hi ",
                          style: Theme.of(context).textTheme.headline6);
                    }

                    // By default, show a loading spinner.
                    return Text("loading...");
                  });
            },
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: false,
        ),
        body: _loaded
            ? SizedBox(
                height: recommendationSectionsData.length *
                    PodcastCardWidget.CARD_HEIGHT,
                child: ListView.builder(
                  itemCount: recommendationSectionsData.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return generateSection(recommendationSectionsData[index]);
                  },
                ),
              )
            : Text("loading..."));
  }
}
