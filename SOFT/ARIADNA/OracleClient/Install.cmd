SET InstallPath=C:\Oracle
SET SourcePath=\\fs1\inst$\ORACLE\NT_193000_client
if Exist %InstallPath% (GoTo :noInstall)
net use O: %SourcePath%
O:
client32\setup.exe -silent -nowait -responseFile %SourcePath%\mood.rsp
timeout 60
copy tnsnames.ora %InstallPath%\product\19.0.0\client_1\network\admin
:noInstall