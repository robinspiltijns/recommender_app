import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/utils.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/components/buttons/custom-text-button.dart';


class LikedEpisodeCard extends StatelessWidget {

  final Episode episode;

  LikedEpisodeCard(this.episode);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: episode.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider),
              ),
            ),
            placeholder: (context, url) => Container(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 34,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(episode.title,
                      style: Theme.of(context).textTheme.episodeTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(    Utils.durationString(episode.duration),
                          style: Theme.of(context).textTheme.episodeDuration)
                  )
                ]
              )
          )
          ),
          SizedBox(width: 10),
          CustomIconButton(Icons.more_horiz),
          SizedBox(width: 10),
          CustomTextButton("More like this"),
        ]
      )
    );
  }
}