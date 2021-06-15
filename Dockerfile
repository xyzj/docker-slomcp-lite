FROM ubuntu:latest

LABEL maintainer="X.Minamoto"
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN	/usr/bin/apt-get -y update; \
	/usr/bin/apt-get -y install apt-utils software-properties-common; \
	/usr/bin/apt-get -y full-upgrade; \
	/usr/bin/apt-get -y install net-tools nano tzdata tmux unzip unrar curl cron nethogs iftop iptraf-ng; \
	/usr/bin/apt-get -y autoremove; \
	/usr/bin/apt-get -y clean; \
	/usr/bin/apt-get -y autoclean; \
	\
	rm -rf /tmp/*; \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
	echo "Asia/Shanghai" > /etc/timezone; \
	dpkg-reconfigure -f noninteractive tzdata; \
    /bin/echo "net.ipv4.tcp_fastopen = 3">>/etc/sysctl.conf; \
    /bin/echo "net.ipv4.ip_forward=1">>/etc/sysctl.conf; \
    /bin/echo "net.ipv6.ip_forward=1">>/etc/sysctl.conf

#COPY	buildfiles /root/
# CMD			/usr/sbin/sshd -D

#ENTRYPOINT	["/root/svr/bin/run.sh"]
