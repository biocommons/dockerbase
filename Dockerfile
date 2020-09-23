FROM ubuntu:20.04

MAINTAINER reecehart@gmail.com

RUN apt update && apt upgrade -y && apt install -y \
    curl \
    git \
    libpq-dev \
    python3-pip \
    rsync \
    zlib1g-dev \
    ;

RUN pip3 install -U setuptools pip
