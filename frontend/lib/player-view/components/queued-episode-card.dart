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


  QueuedEpisodeCardWidget({this.episode, this.onPlay});

  IconData _getPlayButtonIcon(bool isPlayingAudio, String episodeId) {
    return isPlayingAudio && episode.id == episodeId
        ? Icons.pause
        : Icons.play_arrow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Column(
        children: [
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 18),
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
          SizedBox(height: 6)
        ],
      ),
    );
  }
}
