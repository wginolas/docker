FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y squid

COPY start_squid.sh /
COPY squid.conf /etc/squid/squid.conf
CMD bash /start_squid.sh
