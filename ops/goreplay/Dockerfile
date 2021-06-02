FROM buger/goreplay as source

FROM alpine:3.12 as final

RUN apk add xxd

COPY ./ops/goreplay/middleware/compare.sh /opt/
RUN chmod +x /opt/compare.sh
COPY --from=source /gor .
ENTRYPOINT ["./gor"]