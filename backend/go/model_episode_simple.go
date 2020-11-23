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

type EpisodeSimple struct {
	// Episode id.
	Id string `json:"id,omitempty"`
	// Web link of this episode.
	Link string `json:"link,omitempty"`
	// Audio url of this episode, which can be played directly.
	Audio string `json:"audio,omitempty"`
	// Image url for this episode. If an episode doesn't have its own image, then this field would be the url of the podcast artwork image. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300). 
	Image string `json:"image,omitempty"`
	// Episode name.
	Title string `json:"title,omitempty"`

	Podcast *PodcastMinimum `json:"podcast,omitempty"`
	// Thumbnail image (300x300) url for this episode. If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image. 
	Thumbnail string `json:"thumbnail,omitempty"`
	// Html of this episode's full description
	Description string `json:"description,omitempty"`
	// Published date for this episode. In millisecond.
	PubDateMs int32 `json:"pub_date_ms,omitempty"`
	// The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
	ListennotesUrl string `json:"listennotes_url,omitempty"`
	// Audio length of this episode. In seconds.
	AudioLengthSec int32 `json:"audio_length_sec,omitempty"`
	// Whether this podcast contains explicit language.
	ExplicitContent bool `json:"explicit_content,omitempty"`
	// Whether or not this episode's audio is invalid. Podcasters may delete the original audio.
	MaybeAudioInvalid bool `json:"maybe_audio_invalid,omitempty"`
	// Edit url of this episode where you can update the audio url if you find the audio is broken.
	ListennotesEditUrl string `json:"listennotes_edit_url,omitempty"`
}
