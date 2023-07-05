// test server for hugo build content dir
// go run main.go
package main

import (
	"io/fs"
	"log"
	"net/http"
	"time"

	"embed"
)

//go:embed public/*
var content embed.FS

const subPath = "/linux-for-devops-engineers/" // repo name

type (
	// struct for holding response details
	responseData struct {
		status int
		size   int
	}

	// http.ResponseWriter implementation
	loggingResponseWriter struct {
		http.ResponseWriter // compose original http.ResponseWriter
		responseData        *responseData
	}
)

func (r *loggingResponseWriter) Write(b []byte) (int, error) {
	size, err := r.ResponseWriter.Write(b) // write response using original http.ResponseWriter
	r.responseData.size += size            // capture size
	return size, err
}

func (r *loggingResponseWriter) WriteHeader(statusCode int) {
	r.ResponseWriter.WriteHeader(statusCode) // write status code using original http.ResponseWriter
	r.responseData.status = statusCode       // capture status code
}

func WithLogging(h http.Handler) http.Handler {
	logFn := func(rw http.ResponseWriter, req *http.Request) {
		start := time.Now()

		responseData := &responseData{
			status: 0,
			size:   0,
		}
		lrw := loggingResponseWriter{
			ResponseWriter: rw, // compose original http.ResponseWriter
			responseData:   responseData,
		}
		h.ServeHTTP(&lrw, req) // serve the original request
		duration := time.Since(start)
		// log request details
		log.Printf("status=%v method=%v uri=%v  duration=%v size=%v", responseData.status, req.Method, req.RequestURI, duration, responseData.size)
	}
	return http.HandlerFunc(logFn)
}

func main() {
	mux := http.NewServeMux()
	fsys, _ := fs.Sub(content, "public")
	// use embed.
	mux.Handle("/", WithLogging(http.FileServer(http.FS(fsys))))
	// use StripPrefix to modify the request
	// URL's path before the FileServer sees it:
	mux.Handle(subPath, WithLogging(http.StripPrefix(subPath, http.FileServer(http.FS(fsys)))))

	log.Println("http server started on :8080")
	err := http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
