@echo off
COLOR 1f
REM Место расположения архивов
SET bupath=D:\backups2
REM Место расположения sql файлов 
SET sql=db
REM MS SQL Server host 
SET host=localhost


		SET dd=%DATE%
		SET tt=%TIME%
 
		SET /a ddd=1%dd:~0,2%-100
		IF %ddd% LSS 10 (
			SET day=0%ddd%) else (
			SET day=%ddd%)
		SET month=%dd:~3,2%
		SET year=%dd:~6,4%
 
		SET /a ttt=%tt:~0,2%
 
		IF %ttt% LSS 10 (
			SET hour=0%ttt%) else (
			SET hour=%ttt%)
  
		SET minute=%tt:~3,2%
		SET sec=%tt:~6,2%

cd %sql%

for /f "tokens=*" %%i in ('dir /b *.sql') do (
		echo [-----------------------%day%.%month%.%year% %hour%:%minute%:%sec%------------------------]
		echo [---------------------Make %%~ni backup folder---------------------]
		mkdir %bupath%\%%~ni 1>nul 2>nul		
		echo [----------------------Backup %%~ni database-----------------------]
		sqlcmd -S %host% -i %%~ni.sql -o %bupath%\%sql%\%%~ni_%day%.%month%.%year%-%hour%.%minute%.%sec%.log
		echo Done
		echo [--------------------Archiving %%~ni database----------------------]
		"C:\Program Files (x86)\7-Zip\7z.exe" a %bupath%\%%~ni\%%~ni_%day%.%month%.%year%-%hour%.%minute%.%sec%.7z %bupath%\%sql%\*.bak
		"C:\Program Files (x86)\7-Zip\7z.exe" a %bupath%\%%~ni\%%~ni_%day%.%month%.%year%-%hour%.%minute%.%sec%.7z %bupath%\%sql%\*.log
		DEL %bupath%\%sql%\*.bak
		DEL %bupath%\%sql%\*.log
		echo [------------------Remove older %%~ni databases--------------------]
		powershell -executionpolicy RemoteSigned  %bupath%\%sql%\remolder7.ps1
		cls
		)

