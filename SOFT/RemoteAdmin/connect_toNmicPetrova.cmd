for /f "tokens=*" %%i in ('"qwinsta nmicpetrova /server:VIPNETPETROVA |findstr nmic"') do set a1=%%i
set n=%a1:~44,1%
Mstsc.exe /shadow:%n% /v:VIPNETPETROVA /control /noConsentPrompt
pause