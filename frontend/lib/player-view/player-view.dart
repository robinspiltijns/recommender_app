import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:provider/provider.dart';
import 'package:frontend/common/theme.dart';

class PlayerViewWidget extends StatefulWidget {
  @override
  _PlayerViewWidgetState createState() => _PlayerViewWidgetState();
}

class _PlayerViewWidgetState extends State<PlayerViewWidget> {
  bool _isSeeking = false;
  double _seekingPosition = 0;

  Icon getPlayButtonIcon(bool isPlayingAudio) {
    return isPlayingAudio ? Icon(Icons.pause) : Icon(Icons.play_arrow);
  }

  _onPlayButtonPress(PlayerService playerService) {
    if (playerService.isPlayingAudio) {
      playerService.pause();
    } else {
      playerService.resume();
    }
  }

  void _onStartSeeking(double value) {
    setState(() {
      _seekingPosition = value;
      _isSeeking = true;
    });
  }

  void _onEndSeeking(double value, PlayerService playerService) {
    playerService.seek(Duration(seconds: value.round()));
    setState(() {
      _seekingPosition = value;
      _isSeeking = false;
    });
  }

  void _onSeekChange(double value) {
    setState(() {
      _seekingPosition = value;
    });
  }

  VoidCallback _forwardThirty(PlayerService playerService) {
    return () => playerService.forward(Duration(seconds: 30));
  }

  VoidCallback _replayTen(PlayerService playerService) {
    return () => playerService.replay(Duration(seconds: 10));
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
    return Scaffold(
        backgroundColor: Color(0xff28263B),
        appBar: AppBar(
          centerTitle: true,
          title: IconButton(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        // TODO: Zie dat consumer later niet rond queue staat.
        body: Consumer<PlayerService>(
          builder: (context, playerService, child) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                        child: ClipRRect(
                          child: playerService.episodeImage,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playerService.episodeTitle,
                              style: Theme.of(context).textTheme.episodeTitle),
                          SizedBox(height: 5),
                          Text(playerService.episodePublisher,
                              style:
                                  Theme.of(context).textTheme.episodePublisher),
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
                      Slider(
                        onChangeStart: _onStartSeeking,
                        onChangeEnd: (value) =>
                            _onEndSeeking(value, playerService),
                        onChanged: _onSeekChange,
                        value: _isSeeking
                            ? _seekingPosition
                            : playerService.episodePosition.inSeconds
                                .toDouble(),
                        activeColor: Colors.white,
                        inactiveColor: Colors.white.withOpacity(0.1),
                        min: 0,
                        max: playerService.episodeDuration.inSeconds.toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              _formatDuration(_isSeeking
                                  ? Duration(seconds: _seekingPosition.round())
                                  : playerService.episodePosition),
                              style: Theme.of(context).textTheme.timeDuration),
                          Text(
                              _formatTimeLeft(
                                  _isSeeking
                                      ? Duration(
                                          seconds: _seekingPosition.round())
                                      : playerService.episodePosition,
                                  playerService.episodeDuration),
                              style: Theme.of(context).textTheme.timeDuration),
                          Text(_formatDuration(playerService.episodeDuration),
                              style: Theme.of(context).textTheme.timeDuration),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.replay_10),
                              onPressed: _replayTen(playerService),
                              color: Colors.white),
                          SizedBox(width: 40),
                          IconButton(
                              color: Color(0xffEF476F),
                              iconSize: 48.0,
                              icon: getPlayButtonIcon(
                                  playerService.isPlayingAudio),
                              onPressed: () {
                                _onPlayButtonPress(playerService);
                              }),
                          SizedBox(width: 40),
                          IconButton(
                              icon: Icon(Icons.forward_30),
                              onPressed: _forwardThirty(playerService),
                              color: Colors.white),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          playerService
                              .play("44698217937f4d9c9b3e404e6cfce303");
                        },
                        child: Text("start"),
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
