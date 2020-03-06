#!/bin/bash

start-stop-daemon --start --name ftpupgrade --background -d /root/svr/bin --exec /root/svr/bin/ftpupgrade -- -conf=../conf/ftp.conf -http=10007 -ftp=10008
