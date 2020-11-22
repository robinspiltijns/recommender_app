# swagger.model.EpisodeSearchResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**audio** | [**AudioField**](AudioField.md) |  | [optional] [default to null]
**audioLengthSec** | [**AudioLengthSecField**](AudioLengthSecField.md) |  | [optional] [default to null]
**rss** | [**RssField**](RssField.md) |  | [optional] [default to null]
**descriptionHighlighted** | **String** | Highlighted segment of this episode&#x27;s description | [optional] [default to null]
**descriptionOriginal** | **String** | Plain text of this episode&#x27;s description | [optional] [default to null]
**titleHighlighted** | **String** | Highlighted segment of this episode&#x27;s title | [optional] [default to null]
**titleOriginal** | **String** | Plain text of this episode&#x27; title | [optional] [default to null]
**transcriptsHighlighted** | **List&lt;String&gt;** | Up to 2 highlighted segments of the audio transcript of this episode. | [optional] [default to []]
**image** | [**EpisodeImageField**](EpisodeImageField.md) |  | [optional] [default to null]
**thumbnail** | [**EpisodeThumbnailField**](EpisodeThumbnailField.md) |  | [optional] [default to null]
**itunesId** | [**ITunesIdField**](ITunesIdField.md) |  | [optional] [default to null]
**pubDateMs** | [**EpisodePubDateMsField**](EpisodePubDateMsField.md) |  | [optional] [default to null]
**id** | [**EpisodeIdField**](EpisodeIdField.md) |  | [optional] [default to null]
**listennotesUrl** | [**EpisodeLNUrlField**](EpisodeLNUrlField.md) |  | [optional] [default to null]
**explicitContent** | [**ExplicitField**](ExplicitField.md) |  | [optional] [default to null]
**link** | [**LinkField**](LinkField.md) |  | [optional] [default to null]
**podcast** | [**EpisodeSearchResultPodcast**](EpisodeSearchResultPodcast.md) |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

