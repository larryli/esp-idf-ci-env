# Environment for ESP-IDF CI builds

Base on [ubuntu:18.04](https://hub.docker.com/_/ubuntu)
and [ESP-IDF v3.1.1](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/index.html#get-esp-idf)
with [toolchain linux64-1.22.0-80-g6c4433a-5.2.0](https://docs.espressif.com/projects/esp-idf/en/v3.1.1/get-started/linux-setup.html) 

You can write a `.gitlab-ci.yml` file like:

```yaml
image: larryli/esp-idf-ci-env

stages:
  - build

# https://github.com/espressif/esp-idf-template
build_app:
  stage: build
  script:
    - make defconfig
    - make all V=1
  artifacts:
    paths:
      - build/bootloader/bootloader.bin
      - build/partitions_singleapp.bin
      - build/app-template.bin
```
