import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/common/theme.dart';

class QueuedEpisodeCardWidget extends StatelessWidget {
  final Episode episode;

  QueuedEpisodeCardWidget(this.episode);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          // TODO: Use thumbnail.
          imageUrl: episode.imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(image: imageProvider),
            ),
          ),
          placeholder: (context, url) =>
              Container(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episode.title,
                style: Theme.of(context).textTheme.episodeTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                episode.publisher,
                style: Theme.of(context).textTheme.episodeDuration,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        IconButton(
            icon: Icon(Icons.play_arrow),
            color: Color(0xffEF476F),
            onPressed: () {})
      ],
    );
  }
}
