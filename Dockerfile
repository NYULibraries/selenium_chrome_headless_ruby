ARG RUBY_VERSION=2.6

FROM ruby:${RUBY_VERSION}

ARG INSTALL_PATH=/app
RUN groupadd -g 2000 docker -r && \
  useradd -u 1000 -r --no-log-init -m -d "$INSTALL_PATH" -g docker docker

# Install essentials
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install dependencies & Chrome
ARG CHROME_VERSION
RUN : "${CHROME_VERSION:?Need to set CHROME_VERSION non-empty}"
SHELL ["/bin/bash", "-eo", "pipefail", "-c"]
RUN apt-get update && apt-get -y --no-install-recommends --fix-broken install zlib1g-dev liblzma-dev wget xvfb unzip libgconf-2-4 libnss3 nodejs \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
 && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && apt-get -y --no-install-recommends install google-chrome-stable=$CHROME_VERSION \
 && rm -rf /var/lib/apt/lists/*

# Install Chrome driver
ARG CHROMIUM_DRIVER_VERSION
RUN : "${CHROMIUM_DRIVER_VERSION:?Need to set CHROMIUM_DRIVER_VERSION non-empty}"
RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$CHROMIUM_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver

USER docker
WORKDIR $INSTALL_PATH
COPY script/docker-entrypoint.sh ./

ENTRYPOINT ["/app/docker-entrypoint.sh"]
