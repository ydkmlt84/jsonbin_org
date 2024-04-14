FROM node:20-alpine3.19 as BUILDER
LABEL Description="Contains JSONbin image"


WORKDIR /opt/app/

ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM:-linux/amd64}

COPY . /

VOLUME  /opt/config

#Main Run Commands
WORKDIR /opt/app/

ENTRYPOINT ls -la