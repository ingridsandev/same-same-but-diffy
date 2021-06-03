FROM buger/goreplay as source

FROM alpine:3.12 as final

RUN apk add xxd

COPY ./ops/goreplay/middleware/content_modifier.sh /opt/
RUN chmod +x /opt/content_modifier.sh
COPY --from=source /gor .
ENTRYPOINT ["./gor"]