@echo on

set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%

rd /s /q build

set ANT_HOME=%SCRIPT_DIR%ant
set JAVA_HOME=%SCRIPT_DIR%jdk

cmd.exe /c "%SCRIPT_DIR%ant/bin/ant.bat"