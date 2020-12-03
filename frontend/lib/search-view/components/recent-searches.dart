import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/recent-search.dart';
import 'package:frontend/search-view/components/recent-search-card.dart';

class RecentSearchesWidget extends StatefulWidget {
  @override
  _RecentSearchesWidgetState createState() => _RecentSearchesWidgetState();
}

class _RecentSearchesWidgetState extends State<RecentSearchesWidget> {
  List<RecentSearch> recentSearches = [
    RecentSearch("Kamala Harris", DateTime.now()),
    RecentSearch("Kamala Harris", DateTime.now()),
    RecentSearch("Kamala Harris", DateTime.now()),
    RecentSearch("Kamala Harris", DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent searches",
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 20),
        ListView.separated(
          // TODO: Bespreek dit met Joren.
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recentSearches.length,
          itemBuilder: (context, index) {
            return RecentSearchCardWidget(recentSearches[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Color(0x26FFFFFF),
            );
          },
        )
      ],
    );
  }
}
