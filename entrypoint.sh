#!/bin/bash

source /root/.nvm/nvm.sh

if [ ! -z ${NODE_VERSION+x} ]
then
  nvm install $NODE_VERSION
  nvm alias default $NODE_VERSION
fi

# exec CMD
echo ">> exec docker CMD"
echo "$@"
"$@"
