#!/bin/sh
set -e

export TIMEZONE=${TIMEZONE:-UTC}
export COMPACTION=${COMPACTION:-True}
export FLUSH_INTERVAL=${FLUSH_INTERVAL:-1000}
export ZK_QUORUM=${ZK_QUORUM:-localhost}

cp /etc/opentsdb/opentsdb.conf.tpl /etc/opentsdb/opentsdb.conf
sed -i "s#\$TIMEZONE#$TIMEZONE#" /etc/opentsdb/opentsdb.conf
sed -i "s/\$COMPACTION/$COMPACTION/" /etc/opentsdb/opentsdb.conf
sed -i "s/\$FLUSH_INTERVAL/$FLUSH_INTERVAL/" /etc/opentsdb/opentsdb.conf
sed -i "s/\$ZK_QUORUM/$ZK_QUORUM/" /etc/opentsdb/opentsdb.conf

exec /usr/bin/tsdb "$@"
