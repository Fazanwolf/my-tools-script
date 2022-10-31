FROM ubuntu

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install make

COPY . /app

WORKDIR /app