@echo off
setlocal enabledelayedexpansion
chcp 1251 >nul 2>&1
color 0A
title === DEMO ANIMATION ===

cls

for /f %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"

echo.
echo  ============================================
echo   BAT Animation Demo
echo  ============================================
echo.

echo  [1/3] Spinner:
echo.
for /l %%i in (0,1,39) do (
    set /a "f=%%i %% 4"
    if !f!==0 set "ch=/"
    if !f!==1 set "ch=-"
    if !f!==2 set "ch=\ "
    if !f!==3 set "ch=^|"
    <nul set /p "=       [ !ch! ]  Loading...  (%%i/40)"
    ping 127.0.0.1 -n 1 -w 100 >nul
    <nul set /p "=!ESC![1A!ESC![1G"
    echo.
)
echo       [ OK ]  Loading... done!
echo.
ping 127.0.0.1 -n 1 -w 500 >nul

echo  [2/3] Progress bar:
echo.
set "BAR="
for /l %%i in (1,1,40) do (
    set "BAR=!BAR!#"
    set /a "PCT=%%i * 100 / 40"
    <nul set /p "=   [!BAR!] !PCT!%%"
    ping 127.0.0.1 -n 1 -w 70 >nul
    <nul set /p "=!ESC![1A!ESC![1G"
    echo.
)
echo   [########################################] 100%%  done!
echo.
ping 127.0.0.1 -n 1 -w 500 >nul

echo  [3/3] Blink:
echo.
for /l %%i in (1,1,8) do (
    set /a "m=%%i %% 2"
    if !m!==1 (
        <nul set /p "=    *** SYSTEM READY ***"
    ) else (
        <nul set /p "=                       "
    )
    ping 127.0.0.1 -n 1 -w 300 >nul
    <nul set /p "=!ESC![1A!ESC![1G"
    echo.
)
echo     *** SYSTEM READY ***

echo.
echo  ============================================
echo   All done! Press any key to exit.
echo  ============================================
echo.
pause >nul
