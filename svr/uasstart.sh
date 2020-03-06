#!/bin/bash

start-stop-daemon --start --name uas --background -d /root/svr/bin --exec /root/svr/bin/uas -- -conf=uas.conf -http=10002
