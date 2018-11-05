FROM openjdk:8-jdk-alpine

ARG MAVEN_VERSION=3.5.4-r1
ARG CF_CLI_VERSION=6.40.0
ARG DEFAULT_MAVEN_CONFIG=/usr/share/maven/

ENV MAVEN_CONFIG=$DEFAULT_MAVEN_CONFIG

RUN apk --update add --no-cache \
      bash \
      curl wget \
      git \
      zip unzip \
      openssh-client rsync \
      libxml2-utils \
      jq \
      maven=${MAVEN_VERSION} 

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github&version=${CF_CLI_VERSION}" | tar -zx && \
        mv cf /usr/local/bin && \
        mkdir -p ${DEFAULT_MAVEN_CONFIG}

COPY settings.xml ${DEFAULT_MAVEN_CONFIG}/

SHELL ["/bin/bash", "-c"]