#!/bin/bash

if [ ! -z ${NODE_VERSION+x} ]
then
  source /root/.nvm/nvm.sh
  nvm install $NODE_VERSION
  nvm alias default $NODE_VERSION
fi

# exec CMD
echo ">> exec docker CMD"
echo "$@"
"$@"
