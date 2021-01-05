import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/episode-list-item.dart';
import 'package:frontend/common/components/podcast-list-item.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:frontend/search-view/components/more-button.dart';
import 'package:frontend/search-view/components/search-results.dart';

class EpisodePodcastExpandableLists extends StatefulWidget {

  final List<Podcast> podcasts;
  final List<Episode> episodes;

  EpisodePodcastExpandableLists(this.podcasts, this.episodes);

  @override
  _EpisodePodcastExpandableListsState createState() => _EpisodePodcastExpandableListsState();
}

class _EpisodePodcastExpandableListsState extends State<EpisodePodcastExpandableLists> {

  Map<ResultType, String> titles = {
    ResultType.EPISODES : "Episodes",
    ResultType.PODCASTS : "Podcasts"
  };

  int perPage  = 3;
  int presentEpisodes = 3;
  int presentPodcasts = 3;

  Widget episodeResults(BuildContext context) {
    if (this.widget.episodes.length == 0) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No episode search results found.",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return EpisodeListItem(this.widget.episodes[index]);
        },
        childCount: this.presentEpisodes,
      ),
    );
  }

  Widget moreButtonEpisodes(BuildContext context) {
    if (this.widget.episodes.length == 0) {
      return SliverToBoxAdapter(
          child: Container()
      );
    }
    if (presentEpisodes >= 9 || presentEpisodes >= this.widget.episodes.length) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No more episodes to show",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: FlatButton(
          child: MoreButton(),
          onPressed: () {
            setState(() {
              presentEpisodes = min(presentEpisodes + perPage, this.widget.episodes.length);
            });
          },),
      );
    }
  }

  Widget podcastResults(BuildContext context) {
    if (this.widget.podcasts.length == 0) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No podcast search results found.",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return PodcastListItem(this.widget.podcasts[index]);
        },
        childCount: min(this.presentPodcasts, this.widget.podcasts.length),
      ),
    );
  }

  Widget moreButtonPodcasts(BuildContext context) {
    if (this.widget.podcasts.length == 0) {
      return SliverToBoxAdapter(
          child: Container()
      );
    }
    if (presentPodcasts >= 9 || presentPodcasts >= this.widget.podcasts.length) {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          alignment: Alignment.center,
          child: Text(
            "No more podcasts to show",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: FlatButton(
          child: MoreButton(),
          onPressed: () {
            setState(() {
              presentPodcasts = min(presentPodcasts + perPage, this.widget.podcasts.length);
            });
          },),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
                      child: Text(
                        titles[ResultType.EPISODES],
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  episodeResults(context),
                  moreButtonEpisodes(context),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20,),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Text(
                        titles[ResultType.PODCASTS],
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  podcastResults(context),
                  moreButtonPodcasts(context),
                ],
              ),
            );
  }
}
