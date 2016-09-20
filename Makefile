VERSION=2.2.0
URL=https://github.com/OpenTSDB/opentsdb/releases/download/v2.2.0/opentsdb-2.2.0_all.deb
IMAGE=olegfedoseev/opentsdb

.DEFAULT_GOAL: all

all: download build

build:
	docker build --rm -t ${IMAGE} .
	docker build --rm -t ${IMAGE}:${VERSION} .

push:
	docker push ${IMAGE}:${VERSION}

download: clean
	curl -skL ${URL} -o opentsdb-${VERSION}_all.deb
	mkdir ./opentsdb && ar -x opentsdb-${VERSION}_all.deb data.tar.xz && tar -xvf data.tar.xz -C ./opentsdb
	rm data.tar.xz opentsdb-${VERSION}_all.deb

clean:
	rm -rf ./opentsdb

.PHONY: build download
