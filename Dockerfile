FROM node:latest

MAINTAINER Ofir Weinstock <ofir.weinstock@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        build-essential g++ python2.7 python2.7-dev unzip curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp \
    && cd /tmp \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli \
    && rm -f /tmp/get-pip.py \
    && apt-get update \
    && apt-get install -y curl apt-transport-https \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn
