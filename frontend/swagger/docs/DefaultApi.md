# swagger.api.DefaultApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *http://picasso.experiments.cs.kuleuven.be:3955/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBestOfGenre**](DefaultApi.md#getBestOfGenre) | **GET** best-of-genre | Used to get the best podcast from a given genre.
[**getEpisode**](DefaultApi.md#getEpisode) | **GET** episode | used to get the details of an episode
[**getEpisodeRecommendationsBasedOnEpisode**](DefaultApi.md#getEpisodeRecommendationsBasedOnEpisode) | **GET** get-recommendations-based-on/episode | Fetch recommendations based on an episode.
[**getGenres**](DefaultApi.md#getGenres) | **GET** genres | Used to get a list of all podcast genres
[**getPodcast**](DefaultApi.md#getPodcast) | **GET** podcast | used to get the details of a podcast.
[**getPodcastRecommendationsBasedOnPodcast**](DefaultApi.md#getPodcastRecommendationsBasedOnPodcast) | **GET** get-recommendations-based-on/podcast | Fetch recommendations for a podcast
[**getSearchResults**](DefaultApi.md#getSearchResults) | **GET** search | Used to get the search results based on the given search parameters.
[**getTheBestPodcasts**](DefaultApi.md#getTheBestPodcasts) | **GET** get-best-podcasts | Fetch the best podcasts.
[**getTopLevelGenres**](DefaultApi.md#getTopLevelGenres) | **GET** top-level-genres | Used to get a list of all top-level podcast genres
[**test**](DefaultApi.md#test) | **GET** test | used to test whether the backend is running.

# **getBestOfGenre**
> BestPodcastsResponse getBestOfGenre(genreId)

Used to get the best podcast from a given genre.

Returns a list of podcast shows that belong to the given genre id, ranked by popularity.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var genreId = genreId_example; // String | the id of the genre to fetch podcast shows by

try {
    var result = api_instance.getBestOfGenre(genreId);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getBestOfGenre: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **genreId** | **String**| the id of the genre to fetch podcast shows by | 

### Return type

[**BestPodcastsResponse**](BestPodcastsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisode**
> EpisodeFull getEpisode(id)

used to get the details of an episode

returns the details of the podcast episode with the given episode id

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var id = id_example; // String | the is of the episode

try {
    var result = api_instance.getEpisode(id);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getEpisode: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the is of the episode | 

### Return type

[**EpisodeFull**](EpisodeFull.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisodeRecommendationsBasedOnEpisode**
> GetEpisodeRecommendationsResponse getEpisodeRecommendationsBasedOnEpisode(id)

Fetch recommendations based on an episode.

Fetch recommendations based on the given episode id.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var id = id_example; // String | The id of the episode.

try {
    var result = api_instance.getEpisodeRecommendationsBasedOnEpisode(id);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getEpisodeRecommendationsBasedOnEpisode: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The id of the episode. | 

### Return type

[**GetEpisodeRecommendationsResponse**](GetEpisodeRecommendationsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGenres**
> GetGenresResponse getGenres()

Used to get a list of all podcast genres

Returns a list of all podcast genres (this contains their name and id)

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();

try {
    var result = api_instance.getGenres();
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getGenres: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetGenresResponse**](GetGenresResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPodcast**
> PodcastFull getPodcast(id)

used to get the details of a podcast.

returns the details of a podcast.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var id = id_example; // String | The id of the podcast.

try {
    var result = api_instance.getPodcast(id);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getPodcast: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The id of the podcast. | 

### Return type

[**PodcastFull**](PodcastFull.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPodcastRecommendationsBasedOnPodcast**
> GetPodcastRecommendationsResponse getPodcastRecommendationsBasedOnPodcast(id)

Fetch recommendations for a podcast

Fetch up to 8 podcast recommendations based on the given podcast id.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var id = id_example; // String | The id of the show.

try {
    var result = api_instance.getPodcastRecommendationsBasedOnPodcast(id);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getPodcastRecommendationsBasedOnPodcast: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The id of the show. | 

### Return type

[**GetPodcastRecommendationsResponse**](GetPodcastRecommendationsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSearchResults**
> SearchResult getSearchResults(queryString, searchField)

Used to get the search results based on the given search parameters.

Returns the search results based on the given search parameters.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();
var queryString = queryString_example; // String | the string representing the search query
var searchField = searchField_example; // String | 

try {
    var result = api_instance.getSearchResults(queryString, searchField);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getSearchResults: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **queryString** | **String**| the string representing the search query | 
 **searchField** | **String**|  | 

### Return type

[**SearchResult**](SearchResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTheBestPodcasts**
> BestPodcastsResponse getTheBestPodcasts()

Fetch the best podcasts.

Returns the best podcasts.

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();

try {
    var result = api_instance.getTheBestPodcasts();
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getTheBestPodcasts: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BestPodcastsResponse**](BestPodcastsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTopLevelGenres**
> GetGenresResponse getTopLevelGenres()

Used to get a list of all top-level podcast genres

Returns a list of all top-level podcast genres (this contains their name and id)

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();

try {
    var result = api_instance.getTopLevelGenres();
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getTopLevelGenres: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetGenresResponse**](GetGenresResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **test**
> String test()

used to test whether the backend is running.

returns 'Hello World'

### Example
```dart
import 'package:swagger/api.dart';

var api_instance = new DefaultApi();

try {
    var result = api_instance.test();
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->test: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

