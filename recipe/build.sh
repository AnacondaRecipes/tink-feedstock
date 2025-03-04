#!/bin/bash

set -ex

rm -rf ~/^.cache/bazel/
export PYTHON_BIN_PATH="$PYTHON"
export PYTHON_LIB_PATH="$SP_DIR"

if [[ $target_platform == osx-* ]]; then
    ls -la /Library/Developer/CommandLineTools/SDKs/*.sdk
    ls -la /opt/*.sdk
fi

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
