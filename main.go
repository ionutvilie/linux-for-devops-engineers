// test server for hugo build content dir
// go run main.go
package main

import (
	"io/fs"
	"log"
	"net/http"

	"embed"
)

//go:embed public/*
var content embed.FS

func main() {
	mux := http.NewServeMux()

	fsys, _ := fs.Sub(content, "public")
	// use embed.
	mux.Handle("/", http.FileServer(http.FS(fsys)))

	log.Println("http server started on :8080")
	err := http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
