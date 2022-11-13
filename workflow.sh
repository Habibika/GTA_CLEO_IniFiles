#!/bin/bash

NDK_PROJECT_PATH=$(pwd)
echo "[BUILD] Starting NDK..."
ndk-build NDK_PROJECT_PATH=$(pwd) APP_BUILD_SCRIPT=$NDK_PROJECT_PATH/Android.mk NDK_APPLICATION_MK=$NDK_PROJECT_PATH/Application.mk NDK_DEBUG=0
if [ $? -eq 0 ]; then
    echo "[BUILD] Done!"
    exit 0
else
    echo "[BUILD] Failed!"
    exit 1
fi
