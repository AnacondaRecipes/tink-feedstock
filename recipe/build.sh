#!/bin/bash

set -ex

rm -rf ~/^.cache/bazel/
export PYTHON_BIN_PATH="$PYTHON"
export PYTHON_LIB_PATH="$SP_DIR"

${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
