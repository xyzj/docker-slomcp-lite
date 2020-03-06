FROM ubuntu:latest
MAINTAINER      X.Minamoto "xuyuan8720@189.cn"

ENV 			DEBIAN_FRONTEND noninteractive

RUN			/bin/echo 'root:administratorishere' |chpasswd;useradd xy;/bin/echo 'xy:iamlegal' |chpasswd; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y full-upgrade; \
	/usr/bin/apt-get -y install apt-utils; \
	/usr/bin/apt-get -y autoremove; \
	/usr/bin/apt-get -y install net-tools nano tzdata ssh; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	\
	rm -rf /tmp/*; \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	echo "Asia/Shanghai" > /etc/timezone; \
	dpkg-reconfigure -f noninteractive tzdata; \
	/bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
	/bin/echo 'Port 10022' >> /etc/ssh/sshd_config; \
	/bin/echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config; \
	/bin/echo 'export PATH=$PATH:/root/svr'>> /root/.bashrc; \
	/bin/echo 'export PATH=$PATH:/root/svr/bin'>> /root/.bashrc; \
	chown -R root:root /root

COPY	buildfiles /root/
# CMD			/usr/sbin/sshd -D

ENTRYPOINT	["/root/svr/bin/run.sh"]
