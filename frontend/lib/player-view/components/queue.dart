import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/services/queue-service.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/player-view/components/queued-episode-card.dart';
import 'package:provider/provider.dart';

class QueueWidget extends StatefulWidget {
  _QueueWidgetState createState() => _QueueWidgetState();
}

class _QueueWidgetState extends State<QueueWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Queue",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10),
        Consumer<QueueService>(builder: (context, queueService, child) {
                    List<Episode> queue = queueService.queue;
                    if (queue.length == 0) {
                      return Text("No episodes added yet");
                    }
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: queue.length,
                      itemBuilder: (context, index) {
                        return QueuedEpisodeCardWidget(queue[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Color(0x26FFFFFF),
                        );
                      },
                    );
                         }
        ),
      ],
    );
  }
}
