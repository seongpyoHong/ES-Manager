FROM node:10.15.2-alpine


############################################################# Kibana Docker

EXPOSE 5601

ENV KIBANA_VERSION 6.8.2
ENV GOSU_VERSION 1.7
# Install Kibana

RUN apk add --update curl ca-certificates bash && \
  curl -Lso /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" && \
  curl -Lso /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc" && \
  chmod +x /usr/local/bin/gosu && \
  ( curl -Lskj https://artifacts.elastic.co/downloads/kibana/kibana-oss-${KIBANA_VERSION}-linux-x86_64.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv /kibana-${KIBANA_VERSION}-linux-x86_64 /kibana && \
  rm -rf /kibana/node && \
  apk del curl

# Copy run script
COPY run.sh /

CMD ["/run.sh"]
