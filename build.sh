#!/bin/bash

THIS_PATH=$(dirname $(realpath $0))

NAME='fferriere/aphpache'
if [ -n "$FFERRIERE_APHPACHE_IMAGE" ]; then
    NAME="$FFERRIERE_APHPACHE_IMAGE"
fi

docker build -t $NAME $@ $THIS_PATH/.
