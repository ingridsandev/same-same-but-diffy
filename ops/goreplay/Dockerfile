FROM alpine:3.12 as builder

RUN apk add --no-cache ca-certificates openssl
RUN wget https://github.com/buger/goreplay/releases/download/v1.0.0/gor_1.0.0_x64.tar.gz -O gor.tar.gz
RUN tar xzf gor.tar.gz

FROM alpine:3.12 as final

RUN apk add xxd
COPY ./ops/goreplay/middleware/compare.sh /opt/
RUN chmod +x /opt/compare.sh
COPY --from=builder /gor .
ENTRYPOINT ["./gor"]