#!/bin/bash

docker run -dti  --privileged --restart=on-failure -p 10000-10008:10000-10008 -p 10013-10019:10013-10019 -p10060-10069:10060-10069 -v /home/xy/luwak/svr:/root/svr xyzj/slomcp-lite:latest /root/svr/bin/run.sh
