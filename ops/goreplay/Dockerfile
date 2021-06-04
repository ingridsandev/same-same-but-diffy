FROM buger/goreplay as source

FROM alpine:3.12 as final

RUN apk add xxd python3 py3-pip
RUN pip3 install awscli --upgrade --user && \
    mv /root/.local/bin/* /usr/local/bin && \
    apk -v --purge del py-pip

COPY ./ops/goreplay/middleware/forwarder.sh /opt/
RUN chmod +x /opt/forwarder.sh

COPY ./ops/goreplay/middleware/echo.sh /opt/
RUN chmod +x /opt/echo.sh

COPY ./ops/goreplay/files /opt/

COPY --from=source /gor .

ENTRYPOINT ["./gor"]