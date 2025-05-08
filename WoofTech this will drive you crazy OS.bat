@echo off
title WoofTech - This Will Drive You Crazy OS
color 0A
cls
echo *** WoofTech OS Booting... ***
timeout /t 2 >nul
echo Boot Complete. Welcome to WoofTech OS v1.0
echo Type 'HELP' for a list of commands.
echo.
echo *** SYSTEM READY ***
set /a running=true

:: Initialize data locations
set "data[1]="
set "data[2]="
set "data[3]="
set "data[4]="
set "data[5]="
set "data[6]="
set "data[7]="
set "data[8]="
set "data[9]="
set "data[10]="

:menu
set /p command="WoofTechOS> "

if /I "%command%"=="HELP" goto help
if /I "%command%"=="EXIT" exit
if /I "%command%"=="ALU" goto alu
if /I "%command%"=="STATUS" goto status
if /I "%command%"=="READ" goto read
if /I "%command%"=="WRITE" goto write

echo Unknown command: %command%
goto menu

:help
echo *** WoofTech OS Command List ***
echo.
echo HELP    - Display this list of commands
echo EXIT    - Exit WoofTech OS
echo ALU     - Access the Arithmetic Logic Unit
echo STATUS  - Display system status
echo READ    - Read data from locations 1-10
echo WRITE   - Write data to locations 1-10
goto menu

:status
echo *** SYSTEM STATUS ***
echo System is operating normally.
echo RAM: 512MB
echo CPU: WoofCore 1.0GHz
echo Running processes: 4
echo.
goto menu

:alu
echo *** Arithmetic Logic Unit ***
echo Please enter a math operation (e.g., 5+3, 7-2, 4*9, 10/2):
set /p alu_command="ALU> "
echo Calculating...
timeout /t 1 >nul

:: Perform the math operation using the ALU
for /f "tokens=1,2,3" %%a in ("%alu_command%") do (
    set /a result=%%a %%b %%c
)

echo The result of your operation is: %result%
echo.
goto menu

:read
echo *** Reading Data Locations ***
echo Available locations: 1-10
set /p loc="Enter location number (1-10) to read from: "
if "%loc%" geq "1" if "%loc%" leq "10" (
    echo Data at location %loc%: !data[%loc%]!
) else (
    echo Invalid location. Try a number between 1 and 10.
)
echo.
goto menu

:write
echo *** Writing Data to Locations ***
echo Available locations: 1-10
set /p loc="Enter location number (1-10) to write to: "
if "%loc%" geq "1" if "%loc%" leq "10" (
    set /p data_input="Enter data to store at location %loc%: "
    set "data[%loc%]=%data_input%"
    echo Data written to location %loc%.
) else (
    echo Invalid location. Try a number between 1 and 10.
)
echo.
goto menu
