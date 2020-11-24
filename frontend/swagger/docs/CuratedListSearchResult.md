# swagger.model.CuratedListSearchResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [**CuratedIdField**](CuratedIdField.md) |  | [optional] [default to null]
**pubDateMs** | [**CuratedPubDateMsField**](CuratedPubDateMsField.md) |  | [optional] [default to null]
**descriptionHighlighted** | **String** | Highlighted segment of this curated list&#x27;s description | [optional] [default to null]
**descriptionOriginal** | **String** | Plain text of this curated list&#x27;s description | [optional] [default to null]
**titleHighlighted** | **String** | Highlighted segment of this curated list&#x27;s title | [optional] [default to null]
**titleOriginal** | **String** | Plain text of this curated list&#x27;s title | [optional] [default to null]
**listennotesUrl** | [**CuratedLNUrlField**](CuratedLNUrlField.md) |  | [optional] [default to null]
**sourceUrl** | [**CuratedSourceUrlField**](CuratedSourceUrlField.md) |  | [optional] [default to null]
**sourceDomain** | [**CuratedSourceDomainField**](CuratedSourceDomainField.md) |  | [optional] [default to null]
**podcasts** | [**List&lt;PodcastMinimum&gt;**](PodcastMinimum.md) | Up to 5 podcasts in this curated list. | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

