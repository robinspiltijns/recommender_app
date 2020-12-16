import 'package:frontend/common/services/liked-episodes-service.dart';
import 'package:frontend/common/test-utils.dart';
import 'package:frontend/db-helper.dart';
import 'package:frontend/object-model/episode.dart';
import 'package:frontend/object-model/genre.dart';

void main() async {

  print('start test');

  var database = await DatabaseHelper().database;

  var service = LikedEpisodesService(database);

  var episode1 = Episode(
      "test1",
      "test1",
      "test1",
      "test1",
      Duration(seconds: 4),
      Duration(seconds: 4),
      "test1",
      "test1",
      "test1",
      DateTime.now(),
      [OwnGenre.fromId(151)]
  );

  var episode2 = Episode(
      "test2",
      "test2",
      "test2",
      "test2",
      Duration(seconds: 8),
      Duration(seconds: 8),
      "test2",
      "test2",
      "test2",
      DateTime.now(),
      [OwnGenre.fromId(151)]
  );

  service.insertLikedEpisode(episode1);

  var result = await service.getLikedEpisodes();

  assert (result.length == 1);
  assert (TestUtils.episodesEqual(result[0], episode1));

  service.insertLikedEpisode(episode2);

  result = await service.getLikedEpisodes();
  assert (result.length == 2);
  assert (TestUtils.episodesEqual(result[0], episode1));
  assert (TestUtils.episodesEqual(result[1], episode2));


  assert(await service.isLiked(episode1.id));
  assert(await service.isLiked(episode2.id));

  service.deleteLikedEpisode(episode1.id);
  assert(await service.isLiked(episode1.id));

  result = await service.getLikedEpisodes();
  assert (result.length == 1);
  assert (TestUtils.episodesEqual(result[0], episode2));

  service.deleteLikedEpisode(episode2.id);

  result = await service.getLikedEpisodes();
  assert (result.length == 0);

  print("test done");
}