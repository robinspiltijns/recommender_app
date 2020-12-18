import 'package:flutter/material.dart';
import 'package:frontend/search-view/components/search-results.dart';
import 'package:frontend/search-view/components/search-field.dart';
import 'package:swagger/api.dart' as swagger;

import 'components/genres-overview.dart';


class SearchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchWidgetState();

}

class SearchWidgetState extends State<SearchWidget> {



  String query;

  @override
  void initState() {
    super.initState();
    this.query = "";
  }

  final api = swagger.DefaultApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            SearchFieldWidget(
              value: this.query,
              onSubmitted: (value) {
               setState(() {
                 this.query = value;
               });
              },
            ),
            SizedBox(height: 20),
            this.query == "" ? GenresOverview() : SearchResults(this.query)
          ],
        ),
      )
    );
  }
}
