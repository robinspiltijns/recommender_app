import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

class PodcastDetailsBody extends StatelessWidget {

  final PodcastFull podcast;

  PodcastDetailsBody(this.podcast);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: podcast.image,
              imageBuilder: (context, imageProvider) => Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: imageProvider),
                ),
              ),
              placeholder: (context, url) => Container(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

          ],
        )
      ]
    );
  }
}