@echo off
title WoofTech Arcade Emulated System
color 0A
mode con: cols=80 lines=25

:: Fake boot-up
echo Initializing WoofTech Arcade Emulated System v1.02...
ping localhost -n 2 >nul
echo Performing memory check...
ping localhost -n 2 >nul
echo RAM Detected: 2048KB
ping localhost -n 2 >nul
echo VRAM Detected: 512KB
ping localhost -n 2 >nul
echo CPU: 66MHz WoofCore Z1 (Throttled)
ping localhost -n 3 >nul
echo Booting W.A.E.S. Kernel...
ping localhost -n 2 >nul
cls

:mainmenu
cls
echo ------------------------------------------------------
echo        W O O F T E C H   A R C A D E   S Y S T E M
echo ------------------------------------------------------
echo.
echo   Select Game:
echo.
echo   [1] SpaceBarker 1987 (Emulated)
echo   [2] Ruff Riders: Turbo Drift (Demo)
echo   [3] TACO Invaders!
echo   [4] System Info
echo   [0] Shut Down
echo.
set /p choice="> "

if "%choice%"=="1" goto game1
if "%choice%"=="2" goto game2
if "%choice%"=="3" goto game3
if "%choice%"=="4" goto sysinfo
if "%choice%"=="0" goto shutdown
goto mainmenu

:game1
cls
echo Loading SpaceBarker...
ping localhost -n 3 >nul
echo ERROR: Insert Diskette 1 into Drive A:
pause
goto mainmenu

:game2
cls
echo Initializing Ruff Riders...
ping localhost -n 3 >nul
echo NOTE: Game running in DEMO MODE only.
ping localhost -n 2 >nul
echo Welcome to Ruff Riders Turbo Drift!
echo (This would be the game here...)
pause
goto mainmenu

:game3
cls
echo Loading TACO Invaders!
ping localhost -n 2 >nul
echo CPU running at 50%% to simulate heat.
ping localhost -n 1 >nul
echo Pew Pew!
pause
goto mainmenu

:sysinfo
cls
echo -- SYSTEM INFO --
echo.
echo WoofCore Z1 - 66MHz
echo RAM: 2048KB
echo VRAM: 512KB
echo OS: W.A.E.S. Kernel v1.02
echo Emulation Mode: Active
echo.
pause
goto mainmenu

:shutdown
cls
echo Powering down...
ping localhost -n 2 >nul
exit
