FROM ubuntu:latest

LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN		/bin/echo 'root:administratorishere' |chpasswd;useradd xy;/bin/echo 'xy:iamlegal' |chpasswd; \
	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y full-upgrade; \
	/usr/bin/apt-get -y install apt-utils software-properties-common; \
	/usr/bin/apt-get -y autoremove; \
	/usr/bin/apt-get -y install net-tools nano tzdata ssh screen curl cron; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	\
	rm -rf /tmp/*; \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	echo "Asia/Shanghai" > /etc/timezone; \
	dpkg-reconfigure -f noninteractive tzdata; \
        /bin/echo "net.ipv4.tcp_fastopen = 3">>/etc/sysctl.conf; \
        /bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
        /bin/echo "net.ipv6.ip_forward=1">>/etc/sysctl.conf; \
	/bin/echo 'Port 10022' >> /etc/ssh/sshd_config; \
	/bin/echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config; \
	/bin/echo 'export PATH=$PATH:/root/bin'>> /root/.bashrc; \
	chown -R root:root /root

#COPY	buildfiles /root/
# CMD			/usr/sbin/sshd -D

#ENTRYPOINT	["/root/svr/bin/run.sh"]
