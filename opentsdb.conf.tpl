# --------- NETWORK ----------
tsd.network.port = 4242
tsd.network.bind = 0.0.0.0

# Number of worker threads dedicated to Netty, defaults to # of CPUs * 2
#tsd.network.worker_threads = 8

# ----------- HTTP -----------
tsd.http.staticroot = /usr/share/opentsdb/static/
tsd.http.cachedir = /tmp/opentsdb
tsd.http.request.enable_chunked = true
tsd.http.request.max_chunk = 409600

# --------- CORE ----------
tsd.core.timezone = $TIMEZONE
# Whether or not to automatically create UIDs for new metric types, default
# is False
tsd.core.auto_create_metrics = true
tsd.core.preload_uid_cache = true
tsd.core.plugin_path = /usr/share/opentsdb/plugins

# --------- STORAGE ----------
# Whether or not to enable data compaction in HBase, default is True
tsd.storage.enable_compaction 	= $COMPACTION
tsd.storage.flush_interval 		= $FLUSH_INTERVAL
tsd.storage.hbase.zk_quorum 	= $ZK_QUORUM

tsd.storage.hbase.data_table 	= tsdb
tsd.storage.hbase.uid_table 	= tsdb-uid
tsd.storage.hbase.zk_basedir 	= /hbase
tsd.storage.fix_duplicates 		= true
