@echo off
setlocal enabledelayedexpansion
set "filename=woofbot_responses.json"
for /f "delims=" %%a in ('type "%filename%"') do (
    echo !response!
    for /f "tokens=* delims=:" %%b in ("%%a") do (
        set response=%%b
    )
)

set "userInput=%1"
if defined userInput (
    for /f "delims=," %%a in (!response!) do (
        if "!userInput!"=="!%%a:" (
            echo !%%b
            goto end
        )
    )
)

echo I'm sorry, I didn't understand that. Can you please try again?

:end
