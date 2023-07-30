package db

import (
	"database/sql"
	_ "github.com/lib/pq"
	"log"
	"os"
	"testing"
)

const (
	dbDriver     = "postgres"
	dbSourceName = "postgresql://root:1903@localhost:9876/simple_bank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSourceName)
	if err != nil {
		log.Fatal("cannot connect to DB", err)
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
