import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/recent-search.dart';
import 'package:frontend/common/theme.dart';
import 'package:timeago/timeago.dart' as timeago;


class RecentSearchCardWidget extends StatelessWidget {

  final RecentSearch recentSearch;

  const RecentSearchCardWidget(this.recentSearch);

  String get timeString {
    return timeago.format(recentSearch.date);
  }

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(recentSearch.value, style: Theme.of(context).textTheme.episodeTitle),
       Text(timeString, style: Theme.of(context).textTheme.episodeDuration),
     ],
   );
  }

}