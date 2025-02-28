@echo on

:: Python settings
set PYTHON_BIN_PATH=%PYTHON%
set PYTHON_LIB_PATH=%SP_DIR%

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: Now shut down Bazel server, otherwise Windows would not allow moving a directory with it
bazel clean --expunge
bazel shutdown

:: bazel by default makes everything read-only
:: removing readonly from all files and directories
attrib -R /S /D %PREFIX%
attrib -R /S /D %SRC_DIR%
attrib -R /S /D %BUILD_PREFIX%