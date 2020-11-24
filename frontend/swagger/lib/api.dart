library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/io_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/default_api.dart';
part 'model/best_podcasts_response.dart';
part 'model/episode_full.dart';
part 'model/episode_minimum.dart';
part 'model/episode_search_result.dart';
part 'model/episode_search_result_podcast.dart';
part 'model/episode_simple.dart';
part 'model/genre.dart';
part 'model/get_episode_recommendations_response.dart';
part 'model/get_genres_response.dart';
part 'model/get_podcast_recommendations_response.dart';
part 'model/podcast_extra_field.dart';
part 'model/podcast_full.dart';
part 'model/podcast_looking_for_field.dart';
part 'model/podcast_minimum.dart';
part 'model/podcast_search_result.dart';
part 'model/podcast_simple.dart';
part 'model/search_result.dart';

ApiClient defaultApiClient = new ApiClient();
