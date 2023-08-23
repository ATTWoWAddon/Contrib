:: Hard link retail ATT to PTR folder
:: This needs to be executed from the _retail_ folder!
:: This needs to be run as administrator, please execute it from the command line so you can see if there are any errors!
:: If you have previously run this script, you may need to manually remove the symbolic links first (delete them in file explorer in the destination folder, verify they didn't vanish in the source folder, if they did grab them from git again). Then run this script again and verify that all the links are in place.

@echo off

call :link_cdb
call :link_wowfolder "..\World of Warcraft"
call :report_taskcomplete
goto :EOF

:link_wowfolder
if exist "%~1\" (
	echo Checking "%~1\"
	call :link_expansion "%~1\_classic_"
	call :link_expansion "%~1\_classic_era_"
	call :link_expansion "%~1\_retail_"
	call :link_expansion "%~1\_cata_"
)
EXIT /B 0

:link_expansion
if exist "%~1\" (
	echo Checking "%~1\"
	if NOT exist "%~1\Interface\AddOns\AllTheThings" (
		mklink /J "%~1\Interface\AddOns\AllTheThings" "%cd%\AllTheThings"
	)
)
EXIT /B 0

:link_cdb
if NOT exist "%cd%\AllTheThings\db" (
	mklink /J "%cd%\AllTheThings\db" "%cd%\.cdb"
)
EXIT /B 0

:report_taskcomplete
echo Task Complete!
set /p DUMMY=Hit ENTER to close...
EXIT /B 0