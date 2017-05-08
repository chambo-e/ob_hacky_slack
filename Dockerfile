FROM alpine:latest

RUN apk add --update \
          bash \
          curl \
    && rm /var/cache/apk/*


# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

RUN chmod +x slack.sh \
    && touch /tmp/ip.txt \
    && mkdir -p /tmp

ENTRYPOINT ["/usr/src/app/slack.sh"]
