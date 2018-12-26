# Environment for ESP-IDF CI builds

Base on [espressif/esp32-ci-env](https://hub.docker.com/r/espressif/esp32-ci-env)
and set `IDF_PATH` to `/opt/local/espressif/esp-idf`

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
