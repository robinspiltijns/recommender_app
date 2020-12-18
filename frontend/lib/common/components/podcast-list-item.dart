import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/podcast-details-view/podcast-details-view.dart';
import 'package:frontend/common/utils.dart';
import 'package:frontend/object-model/podcast.dart';
import 'package:frontend/common/theme.dart';

class PodcastListItem extends StatelessWidget {
  final Podcast podcast;

  PodcastListItem(this.podcast);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context,
              PodcastDetails.routeName,
              arguments: podcast.id);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).cardColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    child: Image(
                      image: NetworkImage(this.podcast.imageUrl),
                      width: 40,
                      height: 40,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.podcast.title,
                            style: Theme.of(context).textTheme.podcastTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            this.podcast.producer,
                            style: Theme.of(context).textTheme.podcastProducer,
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              podcast.description != null
                  ? Text(Utils.removeAllHtmlTags(podcast.description),
                      style: Theme.of(context).textTheme.description,
                      maxLines: 3,
                    )
                  : Container()
            ],
          ),
        ),
      )
    );
  }
}
