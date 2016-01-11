# docker-opentsdb
Minimal docker image for OpenTSDB (http://opentsdb.net)

OpenTSDB requires HBase, you should set it up yourself.
Image contains only OpenTSDB itself.

# To build image from scratch
## Easy way
Clone this repo: `git clone https://github.com/olegfedoseev/docker-opentsdb.git`
and, just run `make` and it'll do everything else.

## Hard way
Clone this repo: `git clone https://github.com/olegfedoseev/docker-opentsdb.git` <br />
Then, you need download deb-package with prebuild binaries of OpenTSDB.

Run `make download` and you get `opentsdb` directory.

Now you can run `docker build`: <br />
`docker build --rm -t olegfedoseev/opentsdb .`

# How to use this image
If you need to run it as `tsd` command: <br />
`docker run -it --rm -e ZK_QUORUM=hbase-host olegfedoseev/opentsdb query ...`

It's even better if you hide `docker run -it --rm -e ZK_QUORUM=hbase-host olegfedoseev/opentsdb` behind shell-alias.
Then you can run it as "native" opentsdb: `tsd query ...`

If you want to start server:
```
docker run -d -p 4242:4242 \
  -e TIMEZONE=Asia/Novosibirsk \
  -e ZK_QUORUM=db1.hbase,db2.hbase,db3.hbase \
  -e COMPACTION=False \
  olegfedoseev/opentsdb
```

`TIMEZONE` is value for `tsd.core.timezone` <br />
`COMPACTION` is value for `tsd.storage.enable_compaction` <br />
`FLUSH_INTERVAL` is value for `tsd.storage.flush_interval` <br />
`ZK_QUORUM` is value for `tsd.storage.hbase.zk_quorum` <br />
