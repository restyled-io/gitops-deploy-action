# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster
LABEL maintainer="Patrick Brisbin <pbrisbin@restyled.io>"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    git && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY pyproject.toml .
COPY src ./src
RUN pip install .
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
