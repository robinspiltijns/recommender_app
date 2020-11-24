# swagger.model.EpisodeSearchResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Episode id. | [optional] [default to null]
**rss** | **String** | RSS url of this podcast. This field is available only in the PRO plan. | [optional] [default to null]
**link** | **String** | Web link of this episode. | [optional] [default to null]
**audio** | **String** | Audio url of this episode, which can be played directly. | [optional] [default to null]
**image** | **String** | Image url for this episode. If an episode doesn&#x27;t have its own image, then this field would be the url of the podcast artwork image. If you are using PRO plan, then it&#x27;s a high resolution image (1400x1400). If you are using FREE plan, then it&#x27;s the same as **thumbnail**, low resolution image (300x300).  | [optional] [default to null]
**podcast** | [**EpisodeSearchResultPodcast**](EpisodeSearchResultPodcast.md) |  | [optional] [default to null]
**itunesId** | **int** | iTunes id for this podcast. | [optional] [default to null]
**thumbnail** | **String** | Thumbnail image (300x300) url for this episode. If an episode doesn&#x27;t have its own image, then this field would be the url of the podcast artwork thumbnail image.  | [optional] [default to null]
**pubDateMs** | **int** | Published date for this episode. In millisecond. | [optional] [default to null]
**titleOriginal** | **String** | Plain text of this episode&#x27; title | [optional] [default to null]
**listennotesUrl** | **String** | The url of this episode on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**audioLengthSec** | **int** | Audio length of this episode. In seconds. | [optional] [default to null]
**explicitContent** | **bool** | Whether this podcast contains explicit language. | [optional] [default to null]
**titleHighlighted** | **String** | Highlighted segment of this episode&#x27;s title | [optional] [default to null]
**descriptionOriginal** | **String** | Plain text of this episode&#x27;s description | [optional] [default to null]
**descriptionHighlighted** | **String** | Highlighted segment of this episode&#x27;s description | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

