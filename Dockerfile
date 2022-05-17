# FROM ghcr.io/purestake/puppeteer:base_1.0.0
FROM node:16

LABEL "com.github.actions.name" = "Puppeteer Headful"
LABEL "com.github.actions.description" = "A GitHub action to run Puppeteer in headful mode"
LABEL "com.github.actions.icon" = "play"
LABEL "com.github.actions.color" = "green"

LABEL "repository" = "https://github.com/PureStake/puppeteer"
LABEL "homepage" = "https://github.com/PureStake/puppeteer"
LABEL "maintainer" = "PureStake"

# ===============================
RUN  apt-get update \
     # See https://crbug.com/795759
     && apt-get install -yq libgconf-2-4 \
     # Install latest chrome dev package, which installs the necessary libs to
     # make the bundled version of Chromium that Puppeteer installs work.
     && apt-get install -y wget xvfb --no-install-recommends \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y google-chrome-stable --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
# ===============================

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
