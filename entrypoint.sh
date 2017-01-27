#!/bin/sh
set -e

export TIMEZONE=${TIMEZONE:-UTC}
export COMPACTION=${COMPACTION:-True}
export FLUSH_INTERVAL=${FLUSH_INTERVAL:-1000}
export ZK_QUORUM=${ZK_QUORUM:-localhost}
export QUERY_LOG_LEVEL=${QUERY_LOG_LEVEL:-INFO}
export ROOT_LOG_LEVEL=${ROOT_LOG_LEVEL:-INFO}

cp /etc/opentsdb/opentsdb.conf.tpl /etc/opentsdb/opentsdb.conf
sed -i "s#{{TIMEZONE}}#${TIMEZONE}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{COMPACTION}}#${COMPACTION}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{FLUSH_INTERVAL}}#${FLUSH_INTERVAL}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{ZK_QUORUM}}#${ZK_QUORUM}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{ROOT_LOG_LEVEL}}#${ROOT_LOG_LEVEL}#"   -i /etc/opentsdb/logback.xml
sed -i "s#{{QUERY_LOG_LEVEL}}#${QUERY_LOG_LEVEL}#" -i /etc/opentsdb/logback.xml

exec /usr/bin/tsdb "$@"
