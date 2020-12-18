import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/liked-view/components/liked-genres.dart';
import 'package:frontend/object-model/genre.dart';
import 'package:frontend/liked-view/components/liked-episodes.dart';
import 'package:provider/provider.dart';

class LikesWidget extends StatefulWidget {
  @override
  State<LikesWidget> createState() => LikesWidgetState();
}

class LikesWidgetState extends State<LikesWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Likes", style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(children: [
          SizedBox(height: 30),
          Consumer<LikedEpisodesService> (
            builder: (context, likedEpisodesService, child) {
              return FutureBuilder(
                future: likedEpisodesService.getMostLikedGenres(),
                builder: (context, AsyncSnapshot<List<Genre>> snapshot) {
                  if (snapshot.hasData) {
                    return GenresWidget(
                      "Your most liked genres",
                        snapshot.data
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return CircularProgressIndicator();
                }
              );
            }
          ),
          SizedBox(height: 30),
          LikedEpisodesWidget(),
        ]
       )
      )
    );
  }
}
