# Base Image - Node Platform
FROM node:8.16-alpine as node

LABEL maintainer="tkikuchi2000@gmail.com" version="0.1.0"

COPY requirements.txt ./

# MkDocs Material
RUN \
    apk add --update \
        python3; \
    python3 -m ensurepip && \
		rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
		if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi && \
		if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
		pip3 install --no-cache-dir -r requirements.txt && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*



# Install Firebase CLI
RUN yarn global add firebase-tools

