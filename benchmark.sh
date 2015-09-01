#!/bin/sh
mkdir -p data
rebench -d --scheduler=random --without-nice rebench.conf all
REV=`git rev-parse HEAD | cut -c1-8`
TARGET_PATH=~/benchmark-results/somns-agere/$REV
mkdir -p $TARGET_PATH
cp data/* $TARGET_PATH/
