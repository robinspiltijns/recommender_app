# swagger.model.PodcastSearchResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Podcast id. | [optional] [default to null]
**rss** | **String** | RSS url of this podcast. This field is available only in the PRO plan. | [optional] [default to null]
**email** | **String** | The email of this podcast&#x27;s producer. This field is available only in the PRO plan. | [optional] [default to null]
**image** | **String** | Image url for this podcast&#x27;s artwork. If you are using PRO plan, then it&#x27;s a high resolution image (1400x1400). If you are using FREE plan, then it&#x27;s the same as **thumbnail**, low resolution image (300x300).  | [optional] [default to null]
**website** | **String** | Website url of this podcast. | [optional] [default to null]
**genreIds** | **List&lt;int&gt;** |  | [default to []]
**itunesId** | **int** | iTunes id for this podcast. | [optional] [default to null]
**thumbnail** | **String** | Thumbnail image url for this podcast&#x27;s artwork (300x300). | [optional] [default to null]
**listenScore** | **int** | The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it&#x27;ll be null. Learn more at listennotes.com/listen-score  | [optional] [default to null]
**titleOriginal** | **String** | Plain text of podcast name. | [optional] [default to null]
**totalEpisodes** | **int** | Total number of episodes in this podcast. | [optional] [default to null]
**listennotesUrl** | **String** | The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**explicitContent** | **bool** | Whether this podcast contains explicit language. | [optional] [default to null]
**titleHighlighted** | **String** | Highlighted segment of podcast name. | [optional] [default to null]
**latestPubDateMs** | **int** | The published date of the latest episode of this podcast. In milliseconds | [optional] [default to null]
**publisherOriginal** | **String** | Plain text of this podcast&#x27;s publisher name. | [optional] [default to null]
**descriptionOriginal** | **String** | Plain text of podcast description | [optional] [default to null]
**earliestPubDateMs** | **int** | The published date of the oldest episode of this podcast. In milliseconds | [optional] [default to null]
**publisherHighlighted** | **String** | Highlighted segment of this podcast&#x27;s publisher name. | [optional] [default to null]
**descriptionHighlighted** | **String** | Highlighted segment of podcast description | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

