module github.com/robinspiltijns/recommender_app/backend

go 1.14

replace github.com/robinspiltijns/recommender_app/backend/go => ./go

require (
	github.com/gorilla/mux v1.8.0
	github.com/mattn/go-sqlite3 v1.14.5
)
