# swagger.model.TimingResult

## Load the model package
```dart
import 'package:swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** | the unique identifier of this user | [default to null]
**appVersion** | **String** | the version of the app that this user uses | [default to null]
**time** | **int** | the time (in seconds) between the user staring op the app and playing/queueing an episode | [default to null]
**action** | **String** | The action this user takes to end the logging of time. Either playing an episode or adding it to the queue. | [default to null]
**view** | **String** | The view from which the user has carried out the action to stop logging the time. | [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

