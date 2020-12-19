package swagger

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"time"

	db "github.com/robinspiltijns/recommender_app/backend/sqldb"
)

const LISTENAPI_KEY = "d43deaf82b4f450aa686ee4b07c87165"
const EPISODE_TYPE = "episode"
const PODCAST_TYPE = "podcast"

type SearchResultListenNotesEpisodes struct {
	// Pass this value to the **offset** parameter to do pagination of search results.
	NextOffset int32 `json:"next_offset,omitempty"`
	// The time it took to fetch these search results. In seconds.
	Took float64 `json:"took,omitempty"`
	// The total number of search results.
	Total int32 `json:"total,omitempty"`
	// The number of search results in this page.
	Count int32 `json:"count,omitempty"`
	// A list of search results.
	Results []EpisodeSearchResult `json:"results,omitempty"`
}

type SearchResultListenNotesPodcasts struct {
	// Pass this value to the **offset** parameter to do pagination of search results.
	NextOffset int32 `json:"next_offset,omitempty"`
	// The time it took to fetch these search results. In seconds.
	Took float64 `json:"took,omitempty"`
	// The total number of search results.
	Total int32 `json:"total,omitempty"`
	// The number of search results in this page.
	Count int32 `json:"count,omitempty"`
	// A list of search results.
	Results []PodcastSearchResult `json:"results,omitempty"`
}

func TestImpl(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world!")
}

func GetPodcastImpl(w http.ResponseWriter, r *http.Request) {
	id, ok := r.URL.Query()["id"]
	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/podcasts/"+id[0], nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var podcast PodcastFull
	json.Unmarshal(bodyBytes, &podcast)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetEpisodeImpl(w http.ResponseWriter, r *http.Request) {
	id, ok := r.URL.Query()["id"]
	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/episodes/"+id[0], nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	var episode EpisodeFull
	json.Unmarshal(bodyBytes, &episode)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetSearchResultsImpl(w http.ResponseWriter, r *http.Request) {
	query, queryOk := r.URL.Query()["queryString"]
	searchField, searchFieldOk := r.URL.Query()["searchField"]
	if !(queryOk && searchFieldOk) {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	episodeClient := &http.Client{}
	episodeRequest, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/search/", nil)
	episodeRequest.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	eq := episodeRequest.URL.Query()
	eq.Add("q", query[0])
	eq.Add("only_in", searchField[0])
	eq.Add("type", EPISODE_TYPE)
	episodeRequest.URL.RawQuery = eq.Encode()

	episodeResp, episodeErr := episodeClient.Do(episodeRequest)
	if episodeErr != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	podcastClient := &http.Client{}
	podcastRequest, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/search/", nil)
	podcastRequest.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	pq := podcastRequest.URL.Query()
	pq.Add("q", query[0])
	pq.Add("only_in", searchField[0])
	pq.Add("type", PODCAST_TYPE)
	podcastRequest.URL.RawQuery = pq.Encode()

	podcastResp, podcastErr := podcastClient.Do(podcastRequest)
	if podcastErr != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer episodeResp.Body.Close()
	defer podcastResp.Body.Close()
	episodesResultJson, _ := ioutil.ReadAll(episodeResp.Body)
	podcastsResultJson, _ := ioutil.ReadAll(podcastResp.Body)

	var episodeResultLN SearchResultListenNotesEpisodes
	var podcastResultLN SearchResultListenNotesPodcasts
	json.Unmarshal(episodesResultJson, &episodeResultLN)
	json.Unmarshal(podcastsResultJson, &podcastResultLN)

	var searchResult SearchResult
	searchResult.Took = episodeResultLN.Took + podcastResultLN.Took
	searchResult.Total = episodeResultLN.Total + podcastResultLN.Total
	searchResult.Count = episodeResultLN.Count + podcastResultLN.Count

	searchResult.Episoderesults = episodeResultLN.Results
	searchResult.Podcastresults = podcastResultLN.Results

	searchResultOut, err := json.Marshal(searchResult)
	if err != nil {
		panic(err)
	}

	fmt.Fprintf(w, string(searchResultOut))
}

func GetPodcastRecommendationsBasedOnPodcastImpl(w http.ResponseWriter, r *http.Request) {
	id, ok := r.URL.Query()["id"]

	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}

	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/podcasts/"+id[0]+"/recommendations", nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	q := request.URL.Query()
	q.Add("id", id[0])
	request.URL.RawQuery = q.Encode()

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var recommendation GetPodcastRecommendationsResponse
	json.Unmarshal(bodyBytes, &recommendation)

	fmt.Fprintf(w, string(bodyBytes))

}

func GetEpisodeRecommendationsBasedOnEpisodeImpl(w http.ResponseWriter, r *http.Request) {
	id, ok := r.URL.Query()["id"]
	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/episodes/"+id[0]+"/recommendations", nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	q := request.URL.Query()
	q.Add("id", id[0])

	request.URL.RawQuery = q.Encode()

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var recommendation GetEpisodeRecommendationsResponse
	json.Unmarshal(bodyBytes, &recommendation)

	fmt.Fprintf(w, string(bodyBytes))

}

func GetBestOfGenreImpl(w http.ResponseWriter, r *http.Request) {
	id, ok := r.URL.Query()["genreId"]

	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}

	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/best_podcasts", nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	q := request.URL.Query()
	q.Add("genre_id", id[0])

	request.URL.RawQuery = q.Encode()

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var result BestPodcastsResponse
	json.Unmarshal(bodyBytes, &result)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetTheBestPodcastsImpl(w http.ResponseWriter, r *http.Request) {

	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/best_podcasts", nil)

	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var result BestPodcastsResponse
	json.Unmarshal(bodyBytes, &result)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetGenresImpl(w http.ResponseWriter, r *http.Request) {
	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/genres?top_level_only=0", nil)

	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var result GetGenresResponse
	json.Unmarshal(bodyBytes, &result)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetTopLevelGenresImpl(w http.ResponseWriter, r *http.Request) {
	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/genres?top_level_only=1", nil)

	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	resp, err := client.Do(request)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var result GetGenresResponse
	json.Unmarshal(bodyBytes, &result)

	fmt.Fprintf(w, string(bodyBytes))
}

func GetUniqueIdImpl(w http.ResponseWriter, r *http.Request) {
	appVersion, ok := r.URL.Query()["appVersion"]

	if !ok {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	stmt, err := db.DB.Prepare(`
		INSERT INTO timing(user_id, app_version)
			VALUES (?, ?)
		`)

	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	userId := randomString()

	if _, err := stmt.Exec(userId, appVersion[0]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	fmt.Fprintf(w, userId)
}

func GetTimingResultsImpl(w http.ResponseWriter, r *http.Request) {

	rows, err := db.DB.Query(`
		SELECT * FROM timing
	`)

	defer rows.Close()

	var timingResults []TimingResultsResults

	for rows.Next() {
		var id string
		var appVersion string
		var timeStart sql.NullInt64
		var timeStop sql.NullInt64

		if err := rows.Scan(&id, &appVersion, &timeStart, &timeStop); err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			return
		}

		if timeStart.Valid && timeStop.Valid {
			timeDiff := int32(time.Unix(timeStop.Int64, 0).Sub(time.Unix(timeStart.Int64, 0)).Seconds())
			timingResult := TimingResultsResults{
				UserId:     id,
				AppVersion: appVersion,
				Time:       timeDiff,
			}
			timingResults = append(timingResults, timingResult)
		}
	}

	if err := rows.Err(); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	result := TimingResults{
		Datetime: time.Now().String(),
		Results:  timingResults,
	}

	resultBytes, err := json.Marshal(result)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	fmt.Fprintf(w, string(resultBytes))
}

func randomString() string {
	const charset = "ABCDEFGHIJKLMNOPQRSTUVabcdefghijklmonopgrstuvwxyz0123456789"
	b := make([]byte, 30)

	for i := range b {
		b[i] = charset[rand.Intn(len(charset))]
	}

	return string(b)
}

func StartTimePostImpl(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	userId := r.Form.Get("userId")
	if userId == "" {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	stmt, err := db.DB.Prepare(`
		UPDATE timing
		SET start_time = ?
		WHERE user_id = ?
		`)

	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if _, err := stmt.Exec(time.Now().Unix(), userId); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusCreated)
}

func StopTimePostImpl(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	userId := r.Form.Get("userId")
	if userId == "" {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	stmt, err := db.DB.Prepare(`
		UPDATE timing
		SET stop_time = ?
		WHERE user_id = ?
		`)

	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if _, err := stmt.Exec(time.Now().Unix(), userId); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusCreated)
}
