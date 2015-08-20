#!/bin/bash

#!/bin/bash

NAME='fferriere-aphpache'
if [ -n "$FFERRIERE_APHPACHE_NAME" ]; then
    NAME="$FFERRIERE_APHPACHE_NAME"
fi

NB_ROWS=$(docker ps | grep -w "$NAME" | wc -l)
if [ "$NB_ROWS" -gt 0 ]; then
    echo 'already started' >&2
    exit 1
fi

NB_ROWS=$(docker ps -a | grep -w "$NAME" | wc -l)
if [ "$NB_ROWS" -gt 0 ]; then
    docker rm "$NAME"
fi

IMAGE='fferriere/aphpache'
if [ -n "$FFERRIERE_APHPACHE_IMAGE" ]; then
    IMAGE="$FFERRIERE_APHPACHE_IMAGE"
fi

SRC_PATH=$(pwd)
if [ -n "$FFERRIERE_APHPACHE_SRC_PATH" ]; then
    if [ ! -d "$FFERRIERE_APHPACHE_SRC_PATH" ]; then
        echo "$FFERRIERE_APHPACHE_SRC_PATH path doesn't exists !" >&2
        exit 2
    fi
    SRC_PATH="$FFERRIERE_APHPACHE_SRC_PATH"
fi

CNF_PATH=''
if [ -n "$FFERRIERE_APHPACHE_CNF_PATH" ]; then
    if [ ! -d "$FFERRIERE_APHPACHE_CNF_PATH" ]; then
        echo "$FFERRIERE_APHPACHE_CNF_PATH path doesn't exists !" >&2
        exit 2
    fi
    CNF_PATH="$FFERRIERE_APHPACHE_CNF_PATH"
fi

VOL_ARGS="-v $SRC_PATH:/var/www"
if [ -n "$CNF_PATH" ]; then
    VOL_ARGS="$VOL_ARGS -v $CNF_PATH:/etc/apache2/sites-enabled"
fi

docker run -d $VOL_ARGS \
    --name $NAME \
    $IMAGE $@
