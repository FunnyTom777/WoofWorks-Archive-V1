@echo off
title WoofTech Digital Library
color 0F
setlocal enabledelayedexpansion

:: Setup book count and mapping
set bookCount=0

:: Build list of books
for /f "tokens=1* delims==" %%A in ('findstr /R "^Title=" Library.ini') do (
    set /a bookCount+=1
    set "bookTitle[!bookCount!]=%%B"
)

:: Display menu
:main
cls
echo ========================================
echo       WOOFTECH DIGITAL LIBRARY
echo ========================================
echo.
for /l %%i in (1,1,%bookCount%) do (
    setlocal enabledelayedexpansion
    echo  [%%i] !bookTitle[%%i]!
    endlocal
)
echo.
echo  [0] Exit
echo.
set /p choice="Select a book to read: "

:: Handle exit
if "%choice%"=="0" goto exit

:: Check valid choice
if %choice% LEQ 0 goto invalid
if %choice% GTR %bookCount% goto invalid

:: Read and display the selected book
cls
echo ========================================
echo     Reading: !bookTitle[%choice%]!
echo ========================================
echo.

set "section=[Book%choice%]"
set "inSection=false"

for /f "usebackq delims=" %%L in ("Library.ini") do (
    set "line=%%L"

    if "!line!"=="%section%" (
        set "inSection=true"
    ) else if "!line:~0,1!"=="[" (
        set "inSection=false"
    ) else if "!inSection!"=="true" (
        :: Print only Content= lines
        echo !line! | findstr /B "Content=" >nul
        if !errorlevel! == 0 (
            set "contentLine=!line:~8!"
            echo !contentLine!
        )
    )
)

echo.
pause
goto main

:invalid
echo Invalid selection!
pause
goto main

:exit
echo Goodbye!
exit
