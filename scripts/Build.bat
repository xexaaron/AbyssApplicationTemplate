@echo off

set "scriptDir=%~dp0"

REM Flags

set "releaseFlag="
set "debugFlag="
set "exeFlag="
set "helpFlag="

echo.
echo [Status ^`Build.bat`^] ^Start Script

REM Iterate through possible flags passed to the script
for %%i in (%*) do (
    if /I "%%i" == "-h" set "helpFlag=1"
    if /I "%%i" == "-l" set "exeFlag=1"
    if /I "%%i" == "-r" set "releaseFlag=1"
    if /I "%%i" == "-d" set "debugFlag=1"   
)

REM If no flags defined display help info. 
if not defined installFlag if not defined releaseFlag if not defined debugFlag if not defined exeFlag (
    set "helpFlag=1"
)

REM List possible flags that can be passed to [Build.bat] 
if defined helpFlag (
    echo.
    echo ^[Usage `^Build^.bat`^] Usage
    echo  -- Help    : ^-h
    echo  ---- List possible flags for ^Build^.bat.
    echo  -- Release : ^-r
    echo  ---- Build executable in release mode. 
    echo  -- Debug   : ^-d
    echo  ---- Build executable in debug mode.
    echo  -- Launch  : ^-l 
    echo  ---- Launch the executable in release mode.
    echo.
    exit /b 0
)


@echo off

REM Build the project in release mode using Conan / CMake based on the provided flags
if defined releaseFlag (
    echo [Status ^`Build.bat^`] Building Release
    conan build . -build-missing -of build/conan/out/Release -s build_type=Release
)

REM Build the project in debug mode using Conan / CMake based on the provided flags
if defined debugFlag (
    echo [Status ^`Build.bat^`] Building Debug
    conan build . -build-missing -of build/conan/out/Debug -s build_type=Debug
)

if defined exeFlag (
    echo [Status ^`Build.bat^`] Calling executable
    call build\conan\out\release\Release\AbyssApplication.exe
)

echo.
echo [Status ^`Build.bat`^] ^End Script

exit /b