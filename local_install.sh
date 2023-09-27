#!/bin/bash


MY_DIR=$(realpath $(dirname $0))
cd ${MY_DIR}/dist

cp *.json /c/Users/Dejan/AppData/Local/Arduino15
cp *.tar.gz /c/Users/Dejan/AppData/Local/Arduino15/staging/packages/

