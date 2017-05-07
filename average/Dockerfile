FROM python:2.7.13-alpine
MAINTAINER docker@jasonpoon.ca

WORKDIR /app

RUN apk add --no-cache --update \
    build-base \
    freetype-dev \
    libpng-dev \
    && ln -sf /usr/include/locale.h /usr/include/xlocale.h \
    && pip install numpy \
    && pip install matplotlib

COPY average.py /app