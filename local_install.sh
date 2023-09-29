#!/bin/bash


MY_DIR=$(realpath $(dirname $0))
cd ${MY_DIR}/dist

cp *.json /c/Users/${USERNAME}/AppData/Local/Arduino15
cp *.tar.gz /c/Users/${USERNAME}/AppData/Local/Arduino15/staging/packages/

