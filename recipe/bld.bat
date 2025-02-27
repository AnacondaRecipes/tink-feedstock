@echo on

:: Python settings
set PYTHON_BIN_PATH=%PYTHON%
set PYTHON_LIB_PATH=%SP_DIR%
set USE_DEFAULT_PYTHON_LIB_PATH=1

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

if errorlevel 1 exit 1