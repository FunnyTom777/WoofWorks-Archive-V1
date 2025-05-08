@echo off
title RADAR SCAN INITIATED
color 0A
cls
echo ** Radar Initialized **

timeout /t 2 >nul
echo Scanning for nearby anomalies...
timeout /t 3 >nul
echo No threats detected.
timeout /t 1 >nul

:scan
echo.
echo Scanning...
ping localhost -n 2 >nul

:: Simulating radar finding something:
set /a found=%random% %% 10
if %found% lss 3 (
    echo [RADAR] No anomalies found.
    timeout /t 2 >nul
)
if %found% geq 3 (
    echo [RADAR] Anomaly detected: Object A-21
    timeout /t 2 >nul
)
if %found% geq 6 (
    echo [RADAR] Anomaly detected: Object B-37
    timeout /t 2 >nul
)
if %found% geq 8 (
    echo [RADAR] Anomaly detected: Object C-54
    timeout /t 2 >nul
)

:: Increasing frequency of errors and warnings
if %found% geq 9 (
    echo [ERROR] Critical system failure: Anomalies growing exponentially!
    echo [WARNING] System overheating. Please reboot.
    timeout /t 1 >nul
    echo [ERROR] Attempting containment breach!
    timeout /t 1 >nul
)

:: Radar beeping faster and more often:
for /L %%A in (1,1,5) do (
    echo [BEEP] ** Beep detected ** 
    timeout /t 1 >nul
    if %%A geq 4 (
        echo [ERROR] System cannot stop the beeping.
        timeout /t 2 >nul
    )
)

:: Continuous error flood after a while:
echo.
echo [ERROR] Anomalies are spreading beyond containment.
echo [CRITICAL] System failure imminent. Beeping continues...

:: Infinite error loop:
goto scan
