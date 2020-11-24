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

  @override
  void initState() {
    super.initState();
    futureResp = api.getPodcastRecommendationsBasedOnPodcast("4d3fe717742d4963a85562e9f84d8c79");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          FutureBuilder<GetPodcastRecommendationsResponse>(
          future: futureResp,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FeedViewSection(b: RecommendationBasis.PODCAST, recDescription: "This podcast", resList: snapshot.data.recommendations,);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Text("loading...");
            },
          )
          ],
        ));
  }
}