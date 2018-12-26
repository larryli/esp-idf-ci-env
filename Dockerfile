# This dockerfile uses Environment for ESP32 CI builds 
# ESP-IDF CI builds - 3.1.1
# Author: Larry Li

FROM espressif/esp32-ci-env:v8
MAINTAINER Larry Li larryli@qq.com

ENV IDF_PATH=/opt/local/espressif/esp-idf
RUN git clone -b v3.1.1 --recursive https://github.com/espressif/esp-idf.git $IDF_PATH \
    && find $IDF_PATH -type d -name .git -prune -exec rm -rf {} \;
