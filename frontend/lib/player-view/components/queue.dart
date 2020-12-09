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

  // Mock
  List<Episode> episodes = [
   Episode.initialEpisode(),
    Episode.initialEpisode(),
    Episode.initialEpisode(),
    Episode.initialEpisode(),
    Episode.initialEpisode(),
  ];



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
          return FutureBuilder(
              future: queueService.getQueuedEpisodes(),
              builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data.length == 0) {
                    return Text("no episodes added yet.");
                  } else {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return QueuedEpisodeCardWidget(data[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Color(0x26FFFFFF),
                        );
                      },
                    );
                  }
                } else {
                  return CircularProgressIndicator();
                }
              });
        }),
      ],
    );
  }
}
