FROM develar/java:8u45
MAINTAINER Oleg Fedoseev <oleg.fedoseev@me.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
	apk add --update gnuplot tzdata && \
	rm -rf /tmp/* /var/cache/apk/*

ADD opentsdb/etc/opentsdb/ /etc/opentsdb
ADD opentsdb/usr/share/opentsdb /usr/share/opentsdb
ADD opentsdb.conf.tpl /etc/opentsdb/opentsdb.conf.tpl
ADD logback.xml /etc/opentsdb/logback.xml
ADD entrypoint.sh /tsdb

RUN ln -s /usr/share/opentsdb/bin/tsdb /usr/bin/tsdb && sed -i 's/bash/sh/' /usr/bin/tsdb

ENTRYPOINT ["/tsdb"]
EXPOSE 4242
CMD ["tsd"]
