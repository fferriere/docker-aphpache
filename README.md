# docker-aphpache

This project create a container with apache and php5.
The container is base on [docker-base](https://github.com/fferriere/docker-base) image.

## Build
To build container run `build.sh` script.
You can customize image's name with `FFERRIERE_APHPACHE_IMAGE` variable.
Example :
```
$ FFERRIERE_APHPACHE_IMAGE="prefix/aphpache" ./build.sh
```

## run

To run container execute `run.sh` script.
You can customer container's name with `FFERRIERE_APHPACHE_NAME`.
Example:
```
$ FFERRIERE_APHPACHE_NAME='prefix-aphpache' FFERRIERE_APHPACHE_IMAGE='prefix/aphpache' ./run.sh
```

By default, the working directory is bind with `/var/www` on container. You can override volume path with `FFERRIERE_APHPACHE_SRC_PATH` variable.

You can also choose a directory to bind with `/etc/apache2/sites-enabled` on container with `FFERRIERE_APHPACHE_CNF_PATH` variable. With this method you can use multiple VirtualHost or change its easily.

Example:
```
$ export FFERRIERE_APHPACHE_SRC_PATH=$(pwd)'/www'
$ export FFERRIERE_APHPACHE_CNF_PATH=$(pwd)'/cnf'
* ./run.sh
```
