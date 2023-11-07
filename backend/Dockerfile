from python:3.11-slim-bullseye

WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt

RUN pip install -r requirements.txt

COPY ./entrypoint.sh /entrypoint.sh

VOLUME [ "/data" ]

ENTRYPOINT ["/entrypoint.sh"]
