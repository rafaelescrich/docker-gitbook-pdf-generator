FROM python:3.7-alpine3.9
LABEL  MAINTAINER="rafaelescrich <rafaelescrich@gmail.com>"

ENV LIBRARY_PATH /lib:/usr/lib

RUN wget https://github.com/rafaelescrich/gitbook2pdf/archive/refs/tags/v1.0.zip -O /tmp/app.zip && \
    cd /tmp && unzip app.zip && mv /tmp/gitbook2pdf-master /app

RUN apk add build-base python3-dev gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev libxslt-dev && \
    cd /app && pip install -r /app/requirements.txt && \
    apk del build-base && rm -rf /var/cache/apk/*

VOLUME [ "/app/output" ]
VOLUME [ "/usr/share/fonts/" ]

WORKDIR /app

ENTRYPOINT [ "python", "/app/gitbook.py" ]
