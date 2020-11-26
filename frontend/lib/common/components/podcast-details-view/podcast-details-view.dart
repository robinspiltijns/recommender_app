import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';
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

  PodcastFull podcast;

  @override
  void initState() async {
    super.initState();
  }

  getPodcast() async {
    PodcastFull result = await api.getPodcast(widget.id);
    setState(() {
      podcast = result;
    });
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
        child: Column(
          children: [CustomTextButton("go back", callBack: () => {Navigator.pop(context)})
          ]
        )
      )
    );
  }
}
