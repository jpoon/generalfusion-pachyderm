FROM python:2.7.13-alpine

WORKDIR /app

RUN apk add --no-cache --update \
    build-base \
    && ln -sf /usr/include/locale.h /usr/include/xlocale.h \
    && pip install numpy 

COPY average.py /app