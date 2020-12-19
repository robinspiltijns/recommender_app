import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/user-name-service.dart';
import 'package:frontend/feed-view/components/feed-view-section.dart';
import 'package:frontend/feed-view/recommendations/recommendation-retriever.dart';
import 'package:frontend/feed-view/recommendations/recommendation-section-data.dart';
import 'package:provider/provider.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  bool _loaded = false;

  List<RecommendationSectionData> _recommendationSectionData;
  Future<String> name;

  @override
  void initState() {
    super.initState();
    _loadRecommendations();
    // makeFutures();
  }

  Future<void> _loadRecommendations() async {
    await getRecommendations().then((recommendationSectionData) => setState(
        () => {
              _recommendationSectionData = recommendationSectionData,
              _loaded = true
            }));
    return;
  }

  setTitle(UserNameService userNameService) {
    name = userNameService.getUserName();
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
            ? RefreshIndicator(
                color: const Color(0xFFEF476F),
                backgroundColor: Colors.white.withOpacity(0.5),
                child: ListView.builder(
                  itemCount: _recommendationSectionData.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    // TODO: Laat dit de input nemen
                    return FeedViewSection(
                        sectionData: _recommendationSectionData[index]);
                  },
                ),
                onRefresh: () => _loadRecommendations())
            : Text("loading..."));
  }
}
