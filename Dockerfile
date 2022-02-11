FROM golang:1.12-alpine

# Install node and npm
RUN apk update && apk upgrade && apk add --no-cache git nodejs bash npm

# Get dependencies or go part of the build
RUN go get -u github.com/jteeuwen/go-bindata/...
RUN go get github.com/tools/godep

WORKDIR /go/src/github.com/kubernetes-up-and-running/kuard

# copy all sources in
COPY . .

# Set of variables the build script expects
ENV VERBOSE=0
ENV PKG=github.com/kubernetes-up-and-running/kuard
ENV ARCH=amd64
ENV VERSION=test

# When running on Windows 10, you need to clean up the ^Ms in the script
RUN dos2unix build/build.sh

# Do the build. The script is part of incoming sources.
RUN build/build.sh

CMD [ "/go/bin/kuard" ]