import 'package:flutter/cupertino.dart';
import 'package:frontend/feed-view/components/podcast-card.dart';
import 'package:swagger/api.dart';

class FeedWidget extends StatelessWidget {
  final api = DefaultApi();

  FeedWidget() {
    /*
    Future<GetPodcastRecommendationsResponse> futureResponse = api.getPodcastRecommendationsBasedOnPodcast("4d3fe717742d4963a85562e9f84d8c79");
    futureResponse.then((result) => {
      this.podcast = result.recommendations[0]});
    print("response : " + this.podcast.toString());
     */
  }

  //PodcastSimple podcast;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PodcastCardWidget(/*podcast: this.podcast*/),

          ],
        ));
  }
}