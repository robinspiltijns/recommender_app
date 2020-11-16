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

// When **type** is *podcast*.
type PodcastSearchResult struct {

	Rss string `json:"rss,omitempty"`
	// Highlighted segment of podcast description
	DescriptionHighlighted string `json:"description_highlighted,omitempty"`
	// Plain text of podcast description
	DescriptionOriginal string `json:"description_original,omitempty"`

	TitleHighlighted string `json:"title_highlighted,omitempty"`

	TitleOriginal string `json:"title_original,omitempty"`

	PublisherHighlighted string `json:"publisher_highlighted,omitempty"`

	PublisherOriginal string `json:"publisher_original,omitempty"`

	Image string `json:"image,omitempty"`

	Thumbnail string `json:"thumbnail,omitempty"`

	ItunesId int32 `json:"itunes_id,omitempty"`

	LatestPubDateMs int32 `json:"latest_pub_date_ms,omitempty"`

	EarliestPubDateMs int32 `json:"earliest_pub_date_ms,omitempty"`

	Id string `json:"id,omitempty"`

	GenreIds *[]int32 `json:"genre_ids,omitempty"`

	ListennotesUrl string `json:"listennotes_url,omitempty"`

	TotalEpisodes int32 `json:"total_episodes,omitempty"`

	Email string `json:"email,omitempty"`

	ExplicitContent bool `json:"explicit_content,omitempty"`

	Website string `json:"website,omitempty"`

	ListenScore int32 `json:"listen_score,omitempty"`

	ListenScoreGlobalRank string `json:"listen_score_global_rank,omitempty"`
}
