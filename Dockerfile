FROM alpine:3.4

ENV OAUTH2_PROXY_VERSION 2.1
ENV OAUTH2_PROXY_NAME "oauth2_proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.go1.6"
ENV OAUTH2_PROXY_PATH "${OAUTH2_PROXY_NAME}.tar.gz"

ADD "https://github.com/bitly/oauth2_proxy/releases/download/v$OAUTH2_PROXY_VERSION/$OAUTH2_PROXY_PATH" /usr/local/oauth2_proxy.tar.gz

RUN cd /usr/local \
    && tar ztvf oauth2_proxy.tar.gz \
    && tar xzvf oauth2_proxy.tar.gz \
    && mv ${OAUTH2_PROXY_NAME}/oauth2_proxy /bin/ \
    && chmod +x /bin/oauth2_proxy \
    && rm -r oauth2_proxy*

ENTRYPOINT ["oauth2_proxy"]
