FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]