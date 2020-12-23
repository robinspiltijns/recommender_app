# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/robinspiltijns/recommender_app/backend

# Install necessary packages and compile backend.
RUN go get github.com/gorilla/mux
RUN go get github.com/mattn/go-sqlite3
RUN go install github.com/robinspiltijns/recommender_app/backend

# Run the backend command by default when the container starts.
CMD ["/go/bin/backend"]

# Document that the service listens on port 8080.
EXPOSE 8080