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

type BestPodcastsResponse struct {

	HasPrevious bool `json:"has_previous"`
	// This genre's name.
	Name string `json:"name"`
	// Url of the list of best podcasts on [ListenNotes.com](https://www.ListenNotes.com).
	ListennotesUrl string `json:"listennotes_url"`

	PreviousPageNumber int32 `json:"previous_page_number"`

	PageNumber int32 `json:"page_number"`

	HasNext bool `json:"has_next"`

	NextPageNumber int32 `json:"next_page_number"`
	// The id of parent genre.
	ParentId int32 `json:"parent_id"`
	// The id of this genre
	Id int32 `json:"id"`

	Total int32 `json:"total"`

	Podcasts []PodcastSimple `json:"podcasts"`
}
