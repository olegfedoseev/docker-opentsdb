VERSION=2.1.1
URL=https://github.com/OpenTSDB/opentsdb/releases/download/2.1.1/opentsdb-2.1.1_all.deb
IMAGE=olegfedoseev/opentsdb

.DEFAULT_GOAL: all

all: download build

build:
	docker build --rm -t ${IMAGE} .

download: clean
	curl -skL ${URL} -o opentsdb-2.1.1_all.deb
	ar -x opentsdb-2.1.1_all.deb
	mkdir ./opentsdb && tar -xvf data.tar.xz -C ./opentsdb
	rm control.tar.gz data.tar.xz debian-binary opentsdb-2.1.1_all.deb

clean:
	rn -rf ./opentsdb

.PHONY: build download
