# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /work/src/github.com/imthunder/ws-d

WORKDIR /work/src/github.com/imthunder/ws-d

# Build the ws-d command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN go get github.com/lib/pq
RUN go install github.com/imthunder/ws-d

# Run the ws-d command by default when the container starts.
ENTRYPOINT /work/bin/ws-d

# Document that the service listens on port 8080.
EXPOSE 8080
