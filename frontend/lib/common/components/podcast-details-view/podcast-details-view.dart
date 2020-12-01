import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-body.dart';
import 'package:swagger/api.dart';


class PodcastDetails extends StatefulWidget {

  static const String routeName = '/details';

  final String id;

  PodcastDetails(this.id);

  @override
  _PodcastDetailsState createState() => _PodcastDetailsState();
}


class _PodcastDetailsState extends State<PodcastDetails> {

  DefaultApi api = DefaultApi();

  Future<PodcastFull> podcast;

  @override
  void initState() {
    super.initState();
    podcast = getPodcast();
  }

  Future<PodcastFull> getPodcast() {
    print(widget.id);
    return api.getPodcast(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Podcast details", style: Theme.of(context).textTheme.headline5),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<PodcastFull>(
          future: podcast,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }



      )

      )
    );
  }
}
