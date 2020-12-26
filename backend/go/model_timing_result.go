/*
 * Podcast Recommender app
 *
 * This is the API for the podcast recommender app. The API used to get all data is Listen Notes (https://www.listennotes.com/api/)
 *
 * API version: 1.0.0
 * Contact: joren.sjongers@icloud.com
 * Generated by: Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
 */
package swagger

type TimingResult struct {
	// the unique identifier of this user
	SessionId string `json:"session_id,omitempty"`
	// the version of the app that this user uses
	AppVersion string `json:"app_version"`
	// the time (in seconds) between the user staring op the app and playing/queueing an episode
	Time int32 `json:"time"`
	// The action this user takes to end the logging of time. Either playing an episode or adding it to the queue.
	Action string `json:"action"`
	// The primary view from which the user has carried out the action to stop logging the time.
	PrimaryView string `json:"primary_view,omitempty"`

	SecondaryView string `json:"secondary_view,omitempty"`
}
