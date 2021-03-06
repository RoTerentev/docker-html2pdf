#!/bin/sh

# Install latest Chromium package.
echo @curver http://nl.alpinelinux.org/alpine/v${ALPINE_VERSION}/community >> /etc/apk/repositories && \
echo @curver http://nl.alpinelinux.org/alpine/v${ALPINE_VERSION}/main >> /etc/apk/repositories && \
echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
echo @v3.8c http://nl.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories && \
echo @v3.8m http://nl.alpinelinux.org/alpine/v3.8/main >> /etc/apk/repositories && \
apk update && apk upgrade && \
apk add --no-cache --progress \
  chromium@curver \
  nss@curver \
  harfbuzz@curver \
  freetype@curver \
  ttf-freefont@curver \
  libgcj@v3.8m \
  pdftk@v3.8c \
  wqy-zenhei@edge \
  msttcorefonts-installer@curver \
  fontconfig@curver  && \
  update-ms-fonts && \
  fc-cache -f
