package swagger

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

const LISTENAPI_KEY = "d43deaf82b4f450aa686ee4b07c87165"

func TestImpl(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world!")
}

func GetShowImpl(w http.ResponseWriter, r *http.Request) {
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
		log.Fatalln(err)
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	var show Show
	json.Unmarshal(bodyBytes, &show)

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
		log.Fatalln(err)
	}

	defer resp.Body.Close()
	bodyBytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Print(err.Error())
	}

	fmt.Fprintf(w, string(bodyBytes))
}

func GetSearchResultsImpl(w http.ResponseWriter, r *http.Request) {
	query, queryOk := r.URL.Query()["queryString"]
	searchField, searchFieldOk := r.URL.Query()["searchField"]
	if !(queryOk && searchFieldOk) {
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	client := &http.Client{}
	request, _ := http.NewRequest("GET", "https://listen-api.listennotes.com/api/v2/search/", nil)
	request.Header.Set("X-ListenAPI-Key", LISTENAPI_KEY)

	q := request.URL.Query()
	q.Add("q", query[0])
	q.Add("only_in", searchField[0])
	request.URL.RawQuery = q.Encode()

	resp, err := client.Do(request)
	if err != nil {
		log.Fatalln(err)
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	// Convert response body to Todo struct
	var searchResult SearchResult
	json.Unmarshal(bodyBytes, &searchResult)

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
		log.Fatalln(err)
	}

	defer resp.Body.Close()
	bodyBytes, _ := ioutil.ReadAll(resp.Body)

	// Convert response body to Todo struct
	var result BestOfGenreResult
	json.Unmarshal(bodyBytes, &result)

	fmt.Fprintf(w, string(bodyBytes))
}
