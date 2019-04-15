# This dockerfile uses Environment for ESP32 CI builds
#
# Ubuntu 18.04
# https://hub.docker.com/_/ubuntu
#
# Toolchain linux64-1.22.0-80-g6c4433a-5.2.0
# https://docs.espressif.com/projects/esp-idf/en/v3.2/get-started/linux-setup.html
#
# ESP-IDF v3.2
# https://docs.espressif.com/projects/esp-idf/en/v3.2/get-started/index.html#get-esp-idf
#
# Author: Larry Li
# https://github.com/larryli/esp-idf-ci-env

FROM ubuntu:18.04
MAINTAINER Larry Li larryli@qq.com

ENV IDF_PATH="/opt/local/espressif/esp-idf" \
    PATH="/opt/local/espressif/xtensa-esp32-elf/bin:${PATH}"
RUN apt-get update \
    && apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future \
	&& rm -r /var/lib/apt/lists/*
RUN mkdir -p /opt/local/espressif/ \
    && wget -qO- https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    | tar xz -C /opt/local/espressif/
RUN git clone -b v3.2 --depth 1 --recursive https://github.com/espressif/esp-idf.git $IDF_PATH \
    && cd $IDF_PATH && git submodule foreach --recursive 'git gc --aggressive --prune=all'
RUN python -m pip install --user -r $IDF_PATH/requirements.txt