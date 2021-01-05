import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/more-like-this-view/more-like-this-body.dart';
import 'package:swagger/api.dart';
import 'package:frontend/common/theme.dart';


class MoreLikeThis extends StatefulWidget {

  static const String routeName = '/more-like-this';

  final String id;

  MoreLikeThis(this.id);

  @override
  _MoreLikeThisState createState() => _MoreLikeThisState();
}


class _MoreLikeThisState extends State<MoreLikeThis> {

  DefaultApi api = DefaultApi();

  Future<EpisodeFull> episode;

  @override
  void initState() {
    super.initState();
    episode = getEpisode();
  }
  
  getPageTitle(String title) {
    return "More like " + title;
  }

  Future<EpisodeFull>getEpisode() {
    return api.getEpisode(this.widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More like this episode", style: Theme.of(context).textTheme.headline2),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: FutureBuilder <EpisodeFull>(
        future: episode,
        builder: (context, AsyncSnapshot<EpisodeFull> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: CachedNetworkImageProvider(snapshot.data.thumbnail),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 6,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data.title,
                                style: Theme.of(context).textTheme.headline3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              SizedBox(height: 5),
                              Text(snapshot.data.podcast.publisher,
                                  style: Theme.of(context).textTheme.podcastProducer),
                            ]),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  MoreLikeThisBody(snapshot.data)
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();}
      )
    );
  }
}
