#!/bin/sh

# Install latest Chromium package.
echo @curver http://nl.alpinelinux.org/alpine/v${ALPINE_VERSION}/community >> /etc/apk/repositories && \
echo @curver http://nl.alpinelinux.org/alpine/v${ALPINE_VERSION}/main >> /etc/apk/repositories && \
echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk update && apk upgrade && \
apk add --no-cache --progress \
  chromium@curver \
  nss@curver \
  harfbuzz@curver \
  freetype@curver \
  ttf-freefont@curver \
  wqy-zenhei@edge \
  msttcorefonts-installer@curver \
  fontconfig@curver  && \
  update-ms-fonts && fc-cache -f

# Install correct version of Puppeteer (corresponded to installed chromium)
# https://github.com/GoogleChrome/puppeteer/releases
#
# NOTE: actual on 24.03.2019 (depends on Puppeteer's version control)
CHROMIUM_VERSION=$(apk search chromium | sed 's/^chromium-\([0-9]*\).*$/\1/')
PUPPETEER_NPM=puppeteer-core@1.$(echo `expr $CHROMIUM_VERSION - 61`)

npm install ${PUPPETEER_NPM}