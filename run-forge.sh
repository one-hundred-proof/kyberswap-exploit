#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOTENV="$THIS_DIR/.env"
[ -f "$DOTENV" ] && { source "$DOTENV"; }

if [ $# -ge 1 ]; then
   FLAGS=$@
else
   FLAGS="-vv"
fi

if [ "$EVMNET_FORK_URL" = "" ]; then
   echo "Please export EVMNET_FORK_URL to continue"
   echo "e.g."
   echo "   export EVMNET_FORK_URL=\"https://mainnet.infura.io/v3/deadbeefdeadbeefdeadbeefdeadbeef\""
   exit 1
fi

forge test --fork-url "$EVMNET_FORK_URL" --revert-strings debug $FLAGS