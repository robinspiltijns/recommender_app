import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/components/buttons/custom-icon-button.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/player-view/components/time-slider.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';

class PlayerWidget extends StatefulWidget {
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool _isSeeking = false;
  double _seekingPosition = 0;

  IconData getPlayButtonIcon(bool isPlayingAudio) {
    return isPlayingAudio ? Icons.pause : Icons.play_arrow;
  }

  _onPlayButtonPress(PlayerService playerService) {
    if (playerService.isPlaying) {
      playerService.pause();
    } else {
      playerService.resume();
    }
  }

  double getSliderPosition(PlayerService playerService) {
    return _isSeeking
        ? _seekingPosition
        : playerService.episode.position.inSeconds.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerService>(builder: (context, playerService, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 70, right: 70, top: 10),
            child: ClipRRect(
              child: CachedNetworkImage(imageUrl: playerService.episode.imageUrl),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(playerService.episode.title,
                  style: Theme.of(context).textTheme.episodeTitle),
              SizedBox(height: 5),
              Text(playerService.episode.publisher,
                  style: Theme.of(context).textTheme.episodePublisher),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  color: Colors.white),
              SizedBox(width: 40),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.white),
            ],
          ),
          TimeSliderWidget(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                  icon: Icons.replay_10,
                  onTap: () => playerService.replay(10),
                  color: Colors.white),
              SizedBox(width: 40),
              CustomIconButton(
                  icon: getPlayButtonIcon(playerService.isPlaying),
                  onTap: () => _onPlayButtonPress(playerService),
                  size: 45),
              SizedBox(width: 40),
              CustomIconButton(
                  icon: Icons.forward_30,
                  onTap: () => playerService.forward(30),
                  color: Colors.white),
            ],
          ),
        ],
      );
    });
  }
}
