#!/bin/bash

source ./script.inc
source ./config.inc

([ -z $CXX ] && c++ --version || $CXX --version) | grep -q clang-5
if [ $? -eq 0 ]; then
    # we have to make clang compile graal gracefully
    export COMPILER_WARNINGS_FATAL=false
    export USE_CLANG=true
fi
export DEFAULT_VM=graal
export JAVA_HOME=$JAVA8_HOME
export EXTRA_JAVA_HOMES=$JAVA7_HOME

INFO Build Graal
cd graal
./mx.sh clean
#./mx.sh --vm graal build -p
./mx.sh --vm server build -p
OK Graal Build Completed.
