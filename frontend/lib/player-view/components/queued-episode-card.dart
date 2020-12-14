import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/common/theme.dart';
import 'package:provider/provider.dart';

class QueuedEpisodeCardWidget extends StatelessWidget {
  final Episode episode;
  final VoidCallback onPlay;

  // Heel lelijk, moet nog worden gerefactord.
  final double _imageSize = 44;
  final double _totalMargin = 12;

  QueuedEpisodeCardWidget({this.episode, this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: _totalMargin / 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 18),
            CachedNetworkImage(
              imageUrl: episode.imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: _imageSize,
                height: _imageSize,
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
                child: Container(
              height: 44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
            )),
            SizedBox(width: 10),
            CustomIconButton(icon: Icons.play_arrow, onTap: onPlay),
            SizedBox(width: 18),
          ],
        ),
        SizedBox(height: _totalMargin / 2),
      ],
    );
  }
}
