#!/bin/bash

pkill -f uas
pkill -f uigs
pkill -f nboam
pkill -f backend
pkill -f logger
pkill -f task
pkill -f msgpush
pkill -f ftpupgrade
#start-stop-daemon --start --name backend --background -d /root/svr/bin --exec /root/svr/bin/backend -- -conf=backend.conf -http=10000
#start-stop-daemon --start --name uigs --background -d /root/svr/bin --exec /root/svr/bin/uigs -- -conf=uigs.conf -http=10001
#start-stop-daemon --start --name uas --background -d /root/svr/bin --exec /root/svr/bin/uas -- -conf=usermanager.conf -http=10002
#start-stop-daemon --start --name task --background -d /root/svr/bin --exec /root/svr/bin/task -- -conf=task.conf -http=10003
#start-stop-daemon --start --name msgpush --background -d /root/svr/bin --exec /root/svr/bin/msgpush -- -conf=msgpush.conf -http=10005
#start-stop-daemon --start --name logger --background -d /root/svr/bin --exec /root/svr/bin/logger -- -conf=logger.conf -http=10006
