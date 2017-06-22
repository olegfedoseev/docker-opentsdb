#!/bin/sh
set -e

export TIMEZONE=${TIMEZONE:-UTC}
export COMPACTION=${COMPACTION:-True}
export FLUSH_INTERVAL=${FLUSH_INTERVAL:-1000}
export ZK_QUORUM=${ZK_QUORUM:-localhost}
export QUERY_LOG_LEVEL=${QUERY_LOG_LEVEL:-INFO}
export ROOT_LOG_LEVEL=${ROOT_LOG_LEVEL:-INFO}

export DATA_TABLE=${DATA_TABLE:-tsdb}
export UID_TABLE=${UID_TABLE:-tsdb-uid}
export META_TABLE=${META_TABLE:-tsdb-meta}
export TREE_TABLE=${TREE_TABLE:-tsdb-tree}

cp /etc/opentsdb/opentsdb.conf.tpl /etc/opentsdb/opentsdb.conf
sed -i "s#{{TIMEZONE}}#${TIMEZONE}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{COMPACTION}}#${COMPACTION}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{FLUSH_INTERVAL}}#${FLUSH_INTERVAL}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{ZK_QUORUM}}#${ZK_QUORUM}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{ROOT_LOG_LEVEL}}#${ROOT_LOG_LEVEL}#" /etc/opentsdb/logback.xml
sed -i "s#{{QUERY_LOG_LEVEL}}#${QUERY_LOG_LEVEL}#" /etc/opentsdb/logback.xml

sed -i "s#{{DATA_TABLE}}#${DATA_TABLE}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{UID_TABLE}}#${UID_TABLE}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{META_TABLE}}#${META_TABLE}#" /etc/opentsdb/opentsdb.conf
sed -i "s#{{TREE_TABLE}}#${TREE_TABLE}#" /etc/opentsdb/opentsdb.conf

exec /usr/bin/tsdb "$@"
