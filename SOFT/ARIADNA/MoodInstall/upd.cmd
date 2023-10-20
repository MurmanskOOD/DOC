setlocal enabledelayedexpansion
@echo off
SET InstallPath=%ARIADNA_JAVA%
SET SourcePath=\\ariadna-db\ARIADNA\SETUP\JAVA
SET coreupdated=0

IF "%InstallPath%"=="" (
	IF EXIST C:\ARIADNA\JAVA\Uninstall.exe (
		SET InstallPath=C:\ARIADNA\JAVA
	) ELSE (
		IF EXIST C:\ARIADNA\APP\JAVA\Uninstall.exe (
			SET InstallPath=C:\ARIADNA\APP\JAVA
		) ELSE (
			ECHO --- ARIADNA NOT INSTALLED ---
			EXIT
			)
	)
	SETX ARIADNA_JAVA !InstallPath! /M
)

rem echo %InstallPath%
rem pause

net use I:  /delete /y
net use I: %SourcePath%
c:
cd %InstallPath%\Bin
 
for %%A in (Arm*.bat) do (
 set /p vlocal=<%%~nA.ver
 set /p vserver=<I:\%%~nA.ver
 echo %vlocal% %vserver%
 
 rem if !vlocal! LSS !vserver! ( rem - Обновление версий - установка будет произведена только при наличии новой версии на сервере
 if !vlocal! NEQ !vserver! ( rem - установка той версии, которая лежит на сервере, вне зависимости от того младше или старше установлена на клиенте
	CALL I:\Setup%%~nA.exe /S /D=%InstallPath%
	ECHO Setup%%~nA.exe INSTALLED TO %InstallPath%
	SET coreupdated=1
	)
 )
IF !coreupdated! EQU 1 (
	CALL I:\SetupAriadna.exe /S /D=%InstallPath%
	ECHO SetupAriadna.exe INSTALLED TO %InstallPath%
rem "Костыль для исправления инсталлятора, который вместо SetupAriadna.ver создает файл Ariadna.ver"
	IF exist "%ARIADNA_JAVA%\Bin\Ariadna.Ver" (
    	DEL "%ARIADNA_JAVA%\Bin\SetupAriadna.ver"
	)
	RENAME "%ARIADNA_JAVA%\Bin\Ariadna.ver" "SetupAriadna.ver"
rem " конец Костыль для исправления инсталлятора, который вместо SetupAriadna.ver создает файл Ariadna.ver"
	) ELSE echo --- UPDATE IS NOT REQURED ---
net use I:  /delete /y
echo --- END ---



