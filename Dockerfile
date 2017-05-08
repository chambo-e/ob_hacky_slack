FROM alpine:latest

RUN apk add --update \
          bash \
          curl \
    && rm /var/cache/apk/*


# Create app directory
RUN mkdir -p /usr/src/hacky_slack
WORKDIR /usr/src/hacky_slack

# Bundle app source
COPY . /usr/src/hacky_slack

RUN chmod +x slack.sh \
    && touch /tmp/ip.txt \
    && mkdir -p /tmp

ENTRYPOINT ["/usr/src/hacky_slack/slack.sh"]
