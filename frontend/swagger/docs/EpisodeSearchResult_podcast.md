# swagger.model.EpisodeSearchResultPodcast

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Podcast id. | [optional] [default to null]
**image** | **String** | Image url for this podcast&#x27;s artwork. If you are using PRO plan, then it&#x27;s a high resolution image (1400x1400). If you are using FREE plan, then it&#x27;s the same as **thumbnail**, low resolution image (300x300).  | [optional] [default to null]
**genreIds** | **List&lt;int&gt;** |  | [optional] [default to []]
**thumbnail** | **String** | Thumbnail image url for this podcast&#x27;s artwork (300x300). | [optional] [default to null]
**listenScore** | **int** | The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it&#x27;ll be null. Learn more at listennotes.com/listen-score  | [optional] [default to null]
**titleOriginal** | **String** | Plain text of podcast name. | [optional] [default to null]
**listennotesUrl** | **String** | The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**titleHighlighted** | **String** | Highlighted segment of podcast name. | [optional] [default to null]
**publisherOriginal** | **String** | Plain text of this podcast&#x27;s publisher name. | [optional] [default to null]
**publisherHighlighted** | **String** | Highlighted segment of this podcast&#x27;s publisher name. | [optional] [default to null]
**listenScoreGlobalRank** | **String** | The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it&#x27;ll be null. Learn more at listennotes.com/listen-score  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

