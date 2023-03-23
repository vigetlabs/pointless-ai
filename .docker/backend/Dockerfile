FROM ruby:3.2.1

ARG BUILDARCH
ARG NODE_VERSION=16.19.0
ARG WKHTMLTOX=https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye

RUN apt-get update && \
  apt-get install -y ghostscript xfonts-75dpi xfonts-base chromium-driver && \
  rm -rf /var/lib/apt/lists/*

RUN sed -i \
  's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/' \
  /etc/ImageMagick-6/policy.xml

RUN if [ "$BUILDARCH" = "arm64" ]; \
  then curl -sS https://nodejs.org/download/release/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-arm64.tar.gz \
    | tar xzf - --strip-components=1 -C "/usr/local"; \
    curl -sSL -o wkhtmltox.deb ${WKHTMLTOX}_arm64.deb; \
  else curl -sS https://nodejs.org/download/release/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz \
    | tar xzf - --strip-components=1 -C "/usr/local"; \
    curl -sSL -o wkhtmltox.deb ${WKHTMLTOX}_amd64.deb; \
  fi

RUN dpkg -i wkhtmltox.deb && \
  rm wkhtmltox.deb

RUN corepack enable
