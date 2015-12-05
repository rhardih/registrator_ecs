FROM gliderlabs/registrator:v6

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/usr/share/docker"]

ADD ./entrypoint.sh /entrypoint.sh
