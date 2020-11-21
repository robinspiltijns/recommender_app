package swagger

type SearchResultListenNotes struct {
	// Pass this value to the **offset** parameter to do pagination of search results.
	NextOffset int32 `json:"next_offset,omitempty"`
	// The time it took to fetch these search results. In seconds.
	Took float64 `json:"took,omitempty"`
	// The total number of search results.
	Total int32 `json:"total,omitempty"`
	// The number of search results in this page.
	Count int32 `json:"count,omitempty"`
	// A list of search results.
	Results []interface{} `json:"results,omitempty"`
}
