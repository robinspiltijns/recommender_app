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

import (
	"net/http"
)

func GetBestOfGenre(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetBestOfGenreImpl(w, r)
}

func GetEpisode(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetEpisodeImpl(w, r)
}

func GetEpisodeRecommendationsBasedOnEpisode(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetEpisodeRecommendationsBasedOnEpisodeImpl(w, r)
}

func GetGenres(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetGenresImpl(w, r)
}

func GetPodcast(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetPodcastImpl(w, r)
}

func GetPodcastRecommendationsBasedOnPodcast(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetPodcastRecommendationsBasedOnPodcastImpl(w, r)
}

func GetSearchResults(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetSearchResultsImpl(w, r)
}

func GetTheBestPodcasts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetTheBestPodcastsImpl(w, r)
}

func GetTopLevelGenres(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	GetTopLevelGenresImpl(w, r)
}

func Test(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	TestImpl(w, r)
}
