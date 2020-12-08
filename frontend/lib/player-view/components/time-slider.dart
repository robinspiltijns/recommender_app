import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';


class TimeSliderWidget extends StatefulWidget {
  _TimeSliderWidgetState createState() => _TimeSliderWidgetState();
}

class _TimeSliderWidgetState extends State<TimeSliderWidget> {
  bool _isSeeking = false;
  double _seekingPosition = 0;

  double _getSliderPosition(PlayerService playerService) {
    return _isSeeking
        ? _seekingPosition
        : playerService.episode.position.inSeconds.toDouble();
  }

  void _onStartSeeking(double value) {
    setState(() {
      _seekingPosition = value;
      _isSeeking = true;
    });
  }

  void _onSeekChange(double value) {
    setState(() {
      _seekingPosition = value;
    });
  }

  void _onEndSeeking(double value, PlayerService playerService) {
    playerService.seek(Duration(seconds: value.round()));
    setState(() {
      _seekingPosition = value;
      _isSeeking = false;
    });
  }

  static String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString();
    String seconds = duration.inSeconds.remainder(60).toString();
    return minutes.padLeft(2, "0") + ":" + seconds.padLeft(2, "0");
  }

  static String _formatTimeLeft(Duration position, Duration duration) {
    Duration timeLeft = duration - position;
    return timeLeft.inMinutes.toString() + " min. left";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerService>(builder: (context, playerService, child) {
      return Column(
        children: [
          Slider(
            onChangeStart: _onStartSeeking,
            onChangeEnd: (value) => _onEndSeeking(value, playerService),
            onChanged: _onSeekChange,
            value: _getSliderPosition(playerService),
            activeColor: Colors.white,
            inactiveColor: Colors.white.withOpacity(0.1),
            min: 0,
            max: playerService.episode.duration.inSeconds.toDouble(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  _formatDuration(_isSeeking
                      ? Duration(seconds: _seekingPosition.round())
                      : playerService.episode.position),
                  style: Theme.of(context).textTheme.timeDuration),
              Text(
                  _formatTimeLeft(
                      _isSeeking
                          ? Duration(
                          seconds: _seekingPosition.round())
                          : playerService.episode.position,
                      playerService.episode.duration),
                  style: Theme.of(context).textTheme.timeDuration),
              Text(_formatDuration(playerService.episode.duration),
                  style: Theme.of(context).textTheme.timeDuration),
            ],
          )
        ],
      );
    });
  }
}
