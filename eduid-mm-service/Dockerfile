FROM docker.sunet.se/eduid/pythonenv

MAINTAINER eduid-dev <eduid-dev@SEGATE.SUNET.SE>

VOLUME ["/opt/eduid/eduid-mm-service/etc", "/opt/eduid/eduid-mm-service/run"]

#ADD eduid-mm-service-0.1-SNAPSHOT.jar /opt/eduid/eduid-mm-service-0.1-SNAPSHOT.jar

ADD setup.sh /opt/eduid/setup.sh
RUN /opt/eduid/setup.sh

ADD start.sh /start.sh

WORKDIR /

EXPOSE 8080

CMD ["bash", "/start.sh"]
