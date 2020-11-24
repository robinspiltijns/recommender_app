# swagger.model.SearchResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nextOffset** | **int** | Pass this value to the **offset** parameter to do pagination of search results. | [optional] [default to null]
**took** | **double** | The time it took to fetch these search results. In seconds. | [optional] [default to null]
**total** | **int** | The total number of search results. | [optional] [default to null]
**count** | **int** | The number of search results in this page. | [optional] [default to null]
**episoderesults** | [**List&lt;EpisodeSearchResult&gt;**](EpisodeSearchResult.md) | A list of search results for episodes. | [optional] [default to []]
**podcastresults** | [**List&lt;PodcastSearchResult&gt;**](PodcastSearchResult.md) | A list of search results for podcasts. | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

