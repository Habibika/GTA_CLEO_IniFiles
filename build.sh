#!/bin/bash

NDK_PROJECT_PATH=$(pwd)
read -p 'Enter NDK dir: ' NDKPATH
if [ ! -e "$NDKPATH/build/ndk-build" ]; then
    echo 'Error: Invalid NDK!'
    exit 1
fi
echo "NDK located at: $NDKPATH"

BUILDSCRIPT="$NDKPATH/build/ndk-build"

echo "[BUILD] Starting NDK..."
$BUILDSCRIPT NDK_PROJECT_PATH=$(pwd) APP_BUILD_SCRIPT=$NDK_PROJECT_PATH/Android.mk NDK_APPLICATION_MK=$NDK_PROJECT_PATH/Application.mk NDK_DEBUG=0
if [ $? -eq 0 ]; then
    echo "[BUILD] Done!"
    exit 0
else
    echo "[BUILD] Failed!"
    exit 1
fi
