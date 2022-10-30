#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.
'
    exit
fi

_term() {
    echo "Received exit signal"
    exit
}

trap _term SIGTERM
trap _term SIGINT

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")
cd "${THIS_DIR}"

# Script goes here

