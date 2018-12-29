# Environment for ESP-IDF CI builds

Base on [ubuntu:18.04](https://hub.docker.com/_/ubuntu)
and setup [ESP-IDF v3.3-dev](https://github.com/espressif/esp-idf/blob/v3.3-dev/docs/en/get-started/index.rst#get-esp-idf)
with [toolchain linux64-1.22.0-80-g6c4433a-5.2.0](https://github.com/espressif/esp-idf/blob/v3.3-dev/docs/en/get-started/linux-setup.rst) 

```shell
docker run -it --rm larryli/esp-idf-ci-env:v3.3-dev
cd $IDF_PATH/examples/get-started/hello_world
make defconfig
make all V=1
```

You can write a `.gitlab-ci.yml` file like:

```yaml
image: larryli/esp-idf-ci-env:v3.3-dev

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
