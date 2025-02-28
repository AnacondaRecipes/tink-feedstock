@echo on

bazel clean --expunge
bazel shutdown

:: Python settings
set PYTHON_BIN_PATH=%PYTHON%
set PYTHON_LIB_PATH=%SP_DIR%

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: bazel by default makes everything read-only
:: removing readonly from all files and directories
attrib -R /S /D %PREFIX%
attrib -R /S /D %SRC_DIR%
attrib -R /S /D %BUILD_PREFIX%

:: Now shut down Bazel server, otherwise Windows would not allow moving a directory with it
::@for %%G in  ("%SRC_DIR%") DO @SET DRIVE=%%~dG
::bazel "--output_base=%DRIVE%\O" clean --expunge
::bazel "--output_base=%DRIVE%\O" shutdown
bazel clean --expunge
bazel shutdown

:: WARNING conda.gateways.disk.delete:unlink_or_rename_to_trash(184): Could not remove or rename _build_env\Library\lib\modules.  Please remove this file manually (you may need to reboot to free file handles)
rmdir /S "%BUILD_PREFIX%\Library\lib\modules"
