FROM docker.sunet.se/eduid/eduid-webapp

MAINTAINER eduid-dev <eduid-dev@SEGATE.SUNET.SE>

VOLUME ["/opt/eduid/etc/eduid-webapp", "/opt/eduid/run", "/opt/eduid/src", "/var/log"]

WORKDIR /opt/eduid

EXPOSE 8080

ADD start.sh /start.sh

CMD ["bash", "/start.sh"]
