#!/bin/bash
export NAMESILO_API_KEY=f59e74d5e3f373b9e332e9b

export NAMESILO_PROPAGATION_TIMEOUT=1000

export NAMESILO_TTL=3600

export NAMESILO_POLLING_INTERVAL=10

cd /root/svr

./lego --dns namesilo --domains wlst.xyzjdays.xyz --domains baoding.xyzjdays.xyz --email minamoto.xu@outlook.com -a renew --reuse-key

cp -f .lego/certificates/*.xyzjdays.xyz.crt conf/ca/
cp -f .lego/certificates/*.xyzjdays.xyz.key conf/ca/
