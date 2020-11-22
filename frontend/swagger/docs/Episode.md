# swagger.model.Episode

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Episode id. | [optional] [default to null]
**link** | **String** | Web link of this episode. | [optional] [default to null]
**audio** | **String** | Audio url of this episode, which can be played directly. | [optional] [default to null]
**image** | **String** | Image url for this episode. If an episode doesn&#x27;t have its own image, then this field would be the url of the podcast artwork image. If you are using PRO plan, then it&#x27;s a high resolution image (1400x1400). If you are using FREE plan, then it&#x27;s the same as **thumbnail**, low resolution image (300x300).  | [optional] [default to null]
**title** | **String** | Episode name. | [optional] [default to null]
**podcast** | [**Show**](Show.md) |  | [optional] [default to null]
**thumbnail** | **String** | Thumbnail image (300x300) url for this episode. If an episode doesn&#x27;t have its own image, then this field would be the url of the podcast artwork thumbnail image.  | [optional] [default to null]
**description** | **String** | Html of this episode&#x27;s full description | [optional] [default to null]
**pubDateMs** | **int** | Published date for this episode. In millisecond. | [optional] [default to null]
**listennotesUrl** | **String** | The url of this episode on [ListenNotes.com](https://www.ListenNotes.com). | [optional] [default to null]
**audioLengthSec** | **int** | Audio length of this episode. In seconds. | [optional] [default to null]
**explicitContent** | **bool** | Whether this podcast contains explicit language. | [optional] [default to null]
**maybeAudioInvalid** | **bool** | Whether or not this episode&#x27;s audio is invalid. Podcasters may delete the original audio. | [optional] [default to null]
**listennotesEditUrl** | **String** | Edit url of this episode where you can update the audio url if you find the audio is broken. | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

