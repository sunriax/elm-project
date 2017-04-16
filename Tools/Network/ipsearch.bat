@echo off
ECHO.
ECHO SUNriaX Technology
ECHO NETWORK IP SEARCH
ECHO.

ECHO
ECHO Netzwerk Eingabe (xxx.xxx.xxx)
SET /p network="Eingabe: "
ECHO.
ECHO Suchbereich (1 - 254)
SET /p startnet="Startbereich: "
SET /p stopnet="Stoppbereich: "

ECHO.
ECHO Bereich
ECHO %network%.%startnet%-%stopnet%
ECHO.
SET count=%startnet%

:start

cls
ECHO. & ECHO CHECK %network%.%count% & ECHO.
ping -n 1 -w 1000 %network%.%count% >nul

IF %errorlevel%==0 echo %network%.%count% >> %CD%\UP.txt
IF %errorlevel%==1 echo %network%.%count% >> %CD%\DOWN.txt
SET /a count=%count%+1

IF %count%==%stopnet% goto :eof

GOTO start
