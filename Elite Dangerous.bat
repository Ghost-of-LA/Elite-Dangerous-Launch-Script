@echo off
echo Starting Elite Dangerous
start "" "steam://rungameid/359320"

echo Waiting to detect Elite Dangerous
:is_elite_running
tasklist | findstr /I "EliteDangerous64.exe">nul
if not %ERRORLEVEL%==0 ( 
	timeout /t 3 >nul
	goto :is_elite_running
)

echo Starting Elite Dangerous Market Connector
start "" "C:\Program Files (x86)\EDMarketConnector\EDMarketConnector.exe"

:is_elite_shutdown
tasklist | findstr /I "EliteDangerous64.exe">nul
if not %ERRORLEVEL%==0 ( 
	echo Closing Elite Dangerous Market Connector
	taskkill /im EDMarketConnector.exe
) else (
	timeout /t 3 >nul
	goto :is_elite_shutdown
)
