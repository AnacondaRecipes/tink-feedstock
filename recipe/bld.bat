@echo on

bazel clean --expunge
bazel shutdown

set "BAZEL_VC=%VSINSTALLDIR%VC"
set "BAZEL_VS=%VSINSTALLDIR%"

:: Python settings
set PYTHON_BIN_PATH=%PYTHON%
set PYTHON_LIB_PATH=%SP_DIR%

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv


:: Now shut down Bazel server, otherwise Windows would not allow moving a directory with it
bazel clean --expunge
bazel shutdown
