@echo on

bazel --output_base=C:\O clean --expunge
bazel clean --expunge
bazel shutdown

set "BAZEL_VC=%VSINSTALLDIR%VC"
set "BAZEL_VS=%VSINSTALLDIR%"

echo Using Python: %PYTHON%
%PYTHON% --version

:: Python settings
set PYTHON_BIN_PATH="%PYTHON%"
set PYTHON_LIB_PATH="%SP_DIR%"
set PYTHON_VERSION=%PY_VER%

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: Now shut down Bazel server, otherwise Windows would not allow moving a directory with it
bazel --output_base=C:\O clean --expunge
bazel clean --expunge
bazel shutdown
