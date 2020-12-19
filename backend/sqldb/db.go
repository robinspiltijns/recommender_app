package sqldb

import (
	"database/sql"
	"log"
	"os"

	_ "github.com/mattn/go-sqlite3"
)

const dbFileName = "logging-database.db"

// DB is a global variable to hold db connection
var DB *sql.DB

// ConnectDB opens a connection to the database
func ConnectDB() {
	os.Remove(dbFileName)

	log.Println("Creating" + dbFileName + "...")
	file, err := os.Create(dbFileName) // Create SQLite file
	if err != nil {
		log.Fatal(err.Error())
	}
	file.Close()
	log.Println("database file created")

	db, err := sql.Open("sqlite3", "./"+dbFileName)
	if err != nil {
		log.Fatal(err.Error())
	}
	defer db.Close()

	createTable(db)

	DB = db
}

func createTable(db *sql.DB) {
	createTableQuery := `CREATE TABLE timing (
		user_id TEXT PRIMARY KEY NOT NULL,
		app_version TEXT,		
		start_time TEXT,
		stop_time TEXT
	  )`

	log.Println("Create timing table...")
	if _, err := db.Exec(createTableQuery); err != nil {
		log.Fatal(err.Error())
	}

	log.Println("timing table created")
}
