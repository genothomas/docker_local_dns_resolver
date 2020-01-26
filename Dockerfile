FROM ubuntu:latest
COPY /build /opt/build
RUN /bin/bash /opt/build/scripts/setup.sh
COPY /config/named /opt/bind/etc
EXPOSE 53/tcp 53/udp
VOLUME ["/opt/logs"]
CMD ["/bin/bash", "/opt/run.sh"]
