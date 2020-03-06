#!/bin/bash

start-stop-daemon --start --name backend --background -d /root/svr/bin --exec /root/svr/bin/backend -- -conf=backend.conf -http=10004
