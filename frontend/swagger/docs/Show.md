# swagger.model.Show

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Podcast id. | [optional] [default to null]
**rss** | **String** | RSS url of this podcast. This field is available only in the PRO plan. | [optional] [default to null]
**type** | **String** | The type of this podcast - episodic or serial. | [optional] [default to null]
**email** | **String** | The email of this podcast&#x27;s producer. This field is available only in the PRO plan. | [optional] [default to null]
**extra** | [**ShowExtra**](ShowExtra.md) |  | [optional] [default to null]
**image** | **String** | Image url for this podcast&#x27;s artwork. If you are using PRO plan, then it&#x27;s a high resolution image (1400x1400). If you are using FREE plan, then it&#x27;s the same as **thumbnail**, low resolution image (300x300).  | [optional] [default to null]
**title** | **String** | Podcast name. | [optional] [default to null]
**country** | **String** | The country where this podcast is produced. | [optional] [default to null]
**website** | **String** | Website url of this podcast. | [optional] [default to null]
**episodes** | [**List&lt;ShowEpisodes&gt;**](ShowEpisodes.md) |  | [optional] [default to []]
**language** | **String** | The language of this podcast. You can get all supported languages from &#x60;GET /languages&#x60;. | [optional] [default to null]
**genreIds** | **List&lt;int&gt;** |  | [optional] [default to []]
**itunesId** | **int** | iTunes id for this podcast. | [optional] [default to null]
**publisher** | **String** | Podcast publisher name. | [optional] [default to null]
**thumbnail** | **String** | Thumbnail image url for this podcast&#x27;s artwork (300x300). | [optional] [default to null]
**isClaimed** | **bool** | Whether this podcast is claimed by its producer on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**description** | **String** | Html of this episode&#x27;s full description | [optional] [default to null]
**lookingFor** | [**ShowLookingFor**](ShowLookingFor.md) |  | [optional] [default to null]
**listenScore** | **int** | The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it&#x27;ll be null. Learn more at listennotes.com/listen-score  | [optional] [default to null]
**totalEpisodes** | **int** | Total number of episodes in this podcast. | [optional] [default to null]
**listennotesUrl** | **String** | The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**explicitContent** | **bool** | Whether this podcast contains explicit language. | [optional] [default to null]
**latestPubDateMs** | **int** | The published date of the latest episode of this podcast. In milliseconds | [optional] [default to null]
**earliestPubDateMs** | **int** | The published date of the oldest episode of this podcast. In milliseconds | [optional] [default to null]
**nextEpisodePubDate** | **int** | Passed to the **next_episode_pub_date** parameter of &#x60;GET /podcasts/{id}&#x60; to paginate through episodes of that podcast. | [optional] [default to null]
**listenScoreGlobalRank** | **String** | The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it&#x27;ll be null. Learn more at listennotes.com/listen-score  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

