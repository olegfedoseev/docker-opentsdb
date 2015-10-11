#!/bin/sh
set -e

if [ -z "$TIMEZONE" ]; then
	export TIMEZONE=UTC
fi

if [ -z "$COMPACTION" ]; then
	export COMPACTION=True
fi

if [ -z "$FLUSH_INTERVAL" ]; then
	export FLUSH_INTERVAL=1000
fi

if [ -z "$ZK_QUORUM" ]; then
	export ZK_QUORUM=localhost
fi

cp /etc/opentsdb/opentsdb.conf.tpl /etc/opentsdb/opentsdb.conf
sed -i "s#\$TIMEZONE#$TIMEZONE#" /etc/opentsdb/opentsdb.conf
sed -i "s/\$COMPACTION/$COMPACTION/" /etc/opentsdb/opentsdb.conf
sed -i "s/\$FLUSH_INTERVAL/$FLUSH_INTERVAL/" /etc/opentsdb/opentsdb.conf
sed -i "s/\$ZK_QUORUM/$ZK_QUORUM/" /etc/opentsdb/opentsdb.conf

exec /usr/bin/tsdb "$@"
