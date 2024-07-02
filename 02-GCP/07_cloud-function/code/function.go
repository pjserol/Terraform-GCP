package helloworld

import (
	"context"
	"fmt"
	"html"
	"log"
	"net/http"
	"os"

	"github.com/GoogleCloudPlatform/functions-framework-go/functions"

	"cloud.google.com/go/logging"
)

var gcpLogger *logging.Logger

func init() {
	ctx := context.Background()

	projectID := os.Getenv("PROJECT_ID")
	if projectID == "" {
		panic("PROJECT_ID environment variable not set")
	}

	loggingName := os.Getenv("LOGGING_NAME")
	if loggingName == "" {
		panic("LOGGING_NAME environment variable not set")
	}

	client, err := logging.NewClient(ctx, projectID)
	if err != nil {
		log.Fatalf("Failed to create client: %v", err)
	}

	gcpLogger = client.Logger(loggingName)

	functions.HTTP("HelloGo", helloHTTP)
}

func helloHTTP(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	message := fmt.Sprintln("received request helloHTTP")

	logToGCP(message, r.URL.String())

	if name == "" {
		fmt.Fprint(w, "Hello, World!")
		return
	}

	fmt.Fprintf(w, "Hello %s, you are awesome 🤩", html.EscapeString(name))
}

func logToGCP(message string, url string) {
	entry := logging.Entry{
		Payload:  message,
		Severity: logging.Info,
		Labels: map[string]string{
			"url": url,
		},
	}
	gcpLogger.Log(entry)
}
