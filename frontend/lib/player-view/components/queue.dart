import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/player-service.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/player-view/components/queued-episode-card.dart';
import 'package:frontend/player-view/components/reorder_list.dart';
import 'package:provider/provider.dart';

class QueueWidget extends StatefulWidget {
  _QueueWidgetState createState() => _QueueWidgetState();
}

class _QueueWidgetState extends State<QueueWidget> {

  // Let op: dit moet overeenstemmen met de hoogte van een card.
  final double _cardHeight = 56;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SizedBox(width: 18),
          Text(
            "Queue",
            style: Theme.of(context).textTheme.headline2,
          ),
        ]),
        SizedBox(height: 10),
        Consumer<QueueService>(builder: (context, queueService, child) {
          List<Episode> queue = queueService.queue;
          if (queue.length == 0) {
            return Text("No episodes added yet");
          }
          return Container(
              height: queue.length * _cardHeight,
              child: MyReorderableListView(
                  children: queue
                      .asMap()
                      .map((i, episode) {
                        return MapEntry(
                            i,
                            Dismissible(
                              key: UniqueKey(),
                              child: Consumer<PlayerService>(
                                  builder: (context, playerService, child) {
                                return Container(
                                  height: 56,
                                  child: QueuedEpisodeCardWidget(
                                    episode: episode,
                                    onPlay: () {
                                      queueService.pop(i).then((episode) =>
                                          playerService.play(episode));
                                    },
                                  ),
                                );
                              }),
                              onDismissed: (direction) {
                                queueService.pop(i);
                              },
                              background: Container(
                                color: Color(0xFFEF476F),
                              ),
                            ));
                      })
                      .values
                      .toList(),
                  onReorder: queueService.reorder));
        }),
      ],
    );
  }
}
