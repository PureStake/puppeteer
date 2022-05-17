FROM ghcr.io/purestake/puppeteer:base_1.0.0

LABEL "com.github.actions.name" = "Puppeteer Headful"
LABEL "com.github.actions.description" = "A GitHub action to run Puppeteer in headful mode"
LABEL "com.github.actions.icon" = "play"
LABEL "com.github.actions.color" = "green"

LABEL "repository" = "https://github.com/PureStake/puppeteer"
LABEL "homepage" = "https://github.com/PureStake/puppeteer"
LABEL "maintainer" = "PureStake"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
