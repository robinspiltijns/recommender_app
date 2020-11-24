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

// The podcast that this episode belongs to.
type EpisodeSearchResultPodcast struct {
	// Podcast id.
	Id string `json:"id,omitempty"`
	// Image url for this podcast's artwork. If you are using PRO plan, then it's a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**, low resolution image (300x300). 
	Image string `json:"image,omitempty"`

	GenreIds []int32 `json:"genre_ids"`
	// Thumbnail image url for this podcast's artwork (300x300).
	Thumbnail string `json:"thumbnail,omitempty"`
	// The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100. If the score is not available, it'll be null. Learn more at listennotes.com/listen-score 
	ListenScore int32 `json:"listen_score,omitempty"`
	// Plain text of podcast name.
	TitleOriginal string `json:"title_original,omitempty"`
	// The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
	ListennotesUrl string `json:"listennotes_url,omitempty"`
	// Highlighted segment of podcast name.
	TitleHighlighted string `json:"title_highlighted,omitempty"`
	// Plain text of this podcast's publisher name.
	PublisherOriginal string `json:"publisher_original,omitempty"`
	// Highlighted segment of this podcast's publisher name.
	PublisherHighlighted string `json:"publisher_highlighted,omitempty"`
	// The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world. For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score. If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score 
	ListenScoreGlobalRank string `json:"listen_score_global_rank,omitempty"`
}
