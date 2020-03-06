#!/bin/bash

start-stop-daemon --start --name ecms --background -d /root/svr/bin --exec /root/svr/bin/ecms -- -conf=ecms.conf -http=10014 -tml=10013
