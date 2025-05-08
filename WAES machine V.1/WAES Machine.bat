@echo off
title WAES - WoofTech Arcade Emulated System
color 0A
:mainmenu
cls
echo ==========================================
echo     WOOFTECH ARCADE EMULATED SYSTEM
echo ==========================================
echo.
echo  [1] Bark Invaders
echo  [2] Ruff Guess
echo  [3] Boop or Doom
echo  [4] Quit
echo.
set /p choice="Select a game: "

if "%choice%"=="1" goto barkinvaders
if "%choice%"=="2" goto ruffguess
if "%choice%"=="3" goto boopordoom
if "%choice%"=="4" goto exit
goto mainmenu

:barkinvaders
cls
echo The Cat Ships are COMING!! Press [B] to BARK!
choice /c BQ /n /m "Press B to bark, or Q to chicken out: "
if errorlevel 2 (
    echo Oh no! You let them invade!!
) else (
    echo BARK BARK BARK! The cats retreat!!
)
pause
goto mainmenu

:ruffguess
cls
set /a num=%random% %% 10 + 1
set /p guess=Guess the number I'm thinking of (1-10): 
if "%guess%"=="%num%" (
    echo WOW! You guessed right! 🐾
) else (
    echo Nope! I was thinking of %num%.
)
pause
goto mainmenu

:boopordoom
cls
set /a boop=%random% %% 3 + 1
echo Three mysterious buttons lie before you.
echo Only one goes "BOOP". The others? Doom.
set /p pick=Choose 1, 2, or 3: 
if "%pick%"=="%boop%" (
    echo BOOOOOOOOP! You WIN!! :D
) else (
    echo *DOOMED* That was the wrong one! It was %boop%!
)
pause
goto mainmenu

:exit
cls
echo Thank you for playing WAES!
echo Shutting down...
ping localhost -n 3 >nul
exit
