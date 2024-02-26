@echo off
REM CreateClass.bat

set "scriptDir=%~dp0\.."

echo. 
echo ^[Status ^`CreateClass.bat`^] Start Script

:processArg
if "%1" neq "" (
    set "className=%1"
    call :createClassFiles
) else (
    echo.
    echo [Usage `CreateClass.bat`] : ^CreateClass.bat ^<name^>
    echo Creates a cpp and h file in the include and src dir for provided name.
    echo.
    echo [Error `CreateClass.bat`] : Field 'name' required.
)

exit /b

:createClassFiles

echo [Status `CreateClass.bat`] : Creating %className%

if not exist "%scriptDir%\include" mkdir "%scriptDir%\include"
if not exist "%scriptDir%\src" mkdir "%scriptDir%\src"

echo #pragma once >> "%scriptDir%\include\%className%.h"
echo. >> "%scriptDir%\include\%className%.h"
echo #include "Global.h" >> "%scriptDir%\include\%className%.h"
echo. >> "%scriptDir%\include\%className%.h"
echo class %className% { >> "%scriptDir%\include\%className%.h"
echo public: >> "%scriptDir%\include\%className%.h"
echo     %className%(); >> "%scriptDir%\include\%className%.h"
echo     ~%className%(); >> "%scriptDir%\include\%className%.h"
echo }; >> "%scriptDir%\include\%className%.h"

echo #include "../include/%className%.h" >> "%scriptDir%\src\%className%.cpp"
echo. >> "%scriptDir%\src\%className%.cpp"
echo %className%::%className%() { >> "%scriptDir%\src\%className%.cpp"
echo     // Constructor implementation >> "%scriptDir%\src\%className%.cpp"
echo } >> "%scriptDir%\src\%className%.cpp"

echo %className%::~%className%() { >> "%scriptDir%\src\%className%.cpp"
echo     // Destructor implementation >> "%scriptDir%\src\%className%.cpp"
echo } >> "%scriptDir%\src\%className%.cpp"

echo [Status `CreateClass.bat`] : Finished Creating %className%

echo. 
echo ^[Status ^`CreateClass.bat`^] End Script

exit /b

