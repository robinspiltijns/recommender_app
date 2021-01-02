import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/more-like-this-view/more-like-this-body.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-body.dart';
import 'package:swagger/api.dart';
import 'package:frontend/object-model/episode.dart';


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
    print(title);
    return "More like " + title;
  }

  Future<EpisodeFull>getEpisode() {
    return api.getEpisode(this.widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder <EpisodeFull>(
      future: episode,
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Scaffold(
          appBar: AppBar(
            title: Text(getPageTitle(snapshot.data.title), style: Theme.of(context).textTheme.headline5),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  MoreLikeThisBody(snapshot.data),
                ],
              )
              )
          );
      }
      else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();}
    );
  }
}
