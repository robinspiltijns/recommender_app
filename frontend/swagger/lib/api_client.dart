part of swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {

  String basePath;
  var client = new IOClient();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _RegList = new RegExp(r'^List<(.*)>$');
  final _RegMap = new RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "http://localhost:8080/"}) {
    // Setup authentications (key: authentication name, value: authentication).
  }

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'AudioField':
          return new AudioField.fromJson(value);
        case 'AudioLengthSecField':
          return new AudioLengthSecField.fromJson(value);
        case 'BestOfGenreResult':
          return new BestOfGenreResult.fromJson(value);
        case 'BestPodcastsLNUrlField':
          return new BestPodcastsLNUrlField.fromJson(value);
        case 'BestPodcastsResponse':
          return new BestPodcastsResponse.fromJson(value);
        case 'CountryField':
          return new CountryField.fromJson(value);
        case 'CuratedIdField':
          return new CuratedIdField.fromJson(value);
        case 'CuratedLNUrlField':
          return new CuratedLNUrlField.fromJson(value);
        case 'CuratedListSearchResult':
          return new CuratedListSearchResult.fromJson(value);
        case 'CuratedPubDateMsField':
          return new CuratedPubDateMsField.fromJson(value);
        case 'CuratedSourceDomainField':
          return new CuratedSourceDomainField.fromJson(value);
        case 'CuratedSourceUrlField':
          return new CuratedSourceUrlField.fromJson(value);
        case 'EarliestPubDateMsField':
          return new EarliestPubDateMsField.fromJson(value);
        case 'EmailField':
          return new EmailField.fromJson(value);
        case 'Episode':
          return new Episode.fromJson(value);
        case 'EpisodeDescriptionField':
          return new EpisodeDescriptionField.fromJson(value);
        case 'EpisodeIdField':
          return new EpisodeIdField.fromJson(value);
        case 'EpisodeImageField':
          return new EpisodeImageField.fromJson(value);
        case 'EpisodeLNEditUrlField':
          return new EpisodeLNEditUrlField.fromJson(value);
        case 'EpisodeLNUrlField':
          return new EpisodeLNUrlField.fromJson(value);
        case 'EpisodeNameField':
          return new EpisodeNameField.fromJson(value);
        case 'EpisodePubDateMsField':
          return new EpisodePubDateMsField.fromJson(value);
        case 'EpisodeSearchResult':
          return new EpisodeSearchResult.fromJson(value);
        case 'EpisodeSearchResultPodcast':
          return new EpisodeSearchResultPodcast.fromJson(value);
        case 'EpisodeSimple':
          return new EpisodeSimple.fromJson(value);
        case 'EpisodeSimplePodcast':
          return new EpisodeSimplePodcast.fromJson(value);
        case 'EpisodeThumbnailField':
          return new EpisodeThumbnailField.fromJson(value);
        case 'ExplicitField':
          return new ExplicitField.fromJson(value);
        case 'Genre':
          return new Genre.fromJson(value);
        case 'GenreIdsField':
          return new GenreIdsField.fromJson(value);
        case 'GetEpisodeRecommendationsResponse':
          return new GetEpisodeRecommendationsResponse.fromJson(value);
        case 'GetGenresResponse':
          return new GetGenresResponse.fromJson(value);
        case 'GetPodcastRecommendationsResponse':
          return new GetPodcastRecommendationsResponse.fromJson(value);
        case 'ITunesIdField':
          return new ITunesIdField.fromJson(value);
        case 'ImageField':
          return new ImageField.fromJson(value);
        case 'IsClaimedField':
          return new IsClaimedField.fromJson(value);
        case 'LanguageField':
          return new LanguageField.fromJson(value);
        case 'LatestPubDateMsField':
          return new LatestPubDateMsField.fromJson(value);
        case 'LinkField':
          return new LinkField.fromJson(value);
        case 'ListenScoreField':
          return new ListenScoreField.fromJson(value);
        case 'ListenScoreGlobalRankField':
          return new ListenScoreGlobalRankField.fromJson(value);
        case 'MaybeAudioInvalidField':
          return new MaybeAudioInvalidField.fromJson(value);
        case 'PodcastDescriptionField':
          return new PodcastDescriptionField.fromJson(value);
        case 'PodcastExtraField':
          return new PodcastExtraField.fromJson(value);
        case 'PodcastIdField':
          return new PodcastIdField.fromJson(value);
        case 'PodcastLNUrlField':
          return new PodcastLNUrlField.fromJson(value);
        case 'PodcastLookingForField':
          return new PodcastLookingForField.fromJson(value);
        case 'PodcastMinimum':
          return new PodcastMinimum.fromJson(value);
        case 'PodcastNameField':
          return new PodcastNameField.fromJson(value);
        case 'PodcastSearchResult':
          return new PodcastSearchResult.fromJson(value);
        case 'PodcastSimple':
          return new PodcastSimple.fromJson(value);
        case 'PodcastTitleHighlightedField':
          return new PodcastTitleHighlightedField.fromJson(value);
        case 'PodcastTitleOriginalField':
          return new PodcastTitleOriginalField.fromJson(value);
        case 'PodcastTypeField':
           return new PodcastTypeField.fromJson(value);
        case 'PublisherField':
          return new PublisherField.fromJson(value);
        case 'PublisherHighlightedField':
          return new PublisherHighlightedField.fromJson(value);
        case 'PublisherOriginalField':
          return new PublisherOriginalField.fromJson(value);
        case 'RssField':
          return new RssField.fromJson(value);
        case 'SearchResult':
          return new SearchResult.fromJson(value);
        case 'Show':
          return new Show.fromJson(value);
        case 'ShowEpisodes':
          return new ShowEpisodes.fromJson(value);
        case 'ShowExtra':
          return new ShowExtra.fromJson(value);
        case 'ShowLookingFor':
          return new ShowLookingFor.fromJson(value);
        case 'ThumbnailField':
          return new ThumbnailField.fromJson(value);
        case 'TotalEpisodesField':
          return new TotalEpisodesField.fromJson(value);
        case 'WebsiteField':
          return new WebsiteField.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _RegList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType)).toList();
            } else if (value is Map &&
                (match = _RegMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return new Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } catch (e, stack) {
      throw new ApiException.withInner(500, 'Exception during deserialization.', e, stack);
    }
    throw new ApiException(500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
                             String method,
                             Iterable<QueryParam> queryParams,
                             Object body,
                             Map<String, String> headerParams,
                             Map<String, String> formParams,
                             String contentType,
                             List<String> authNames) async {

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams.where((p) => p.value != null).map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ?
                         '?' + ps.join('&') :
                         '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if(body is MultipartRequest) {
      var request = new MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded" ? formParams : serialize(body);
      switch(method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames, List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null) throw new ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}
