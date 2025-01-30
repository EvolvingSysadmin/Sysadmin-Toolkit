# PowerShell Examples

* Find a command: `Get-Command *keyword*`
* Find a file: `Get-ChildItem -Path C:\ -Include *interesting-file.txt* -File -Recurse`
* Get file contents: `Get-Content -Path 'C:\Program Files\interesting-file.txt.txt'`
* Get number of cmdlets installed on system: `Get-Command | Where-Object -Property CommandType -eq Cmdlet | Measure-Object`
* File hash: `Get-FileHash -Path C:\File-Path`
* PWD: `Get-Location`
* Decode Base64: `certutil -decode "C:\Users\Administrator\Desktop\b64.txt" decode.txt`
* Get users: `Get-LocalUser`
* Users with password required set to false: `Get-LocalUser | Where-Object -Property PasswordRequired -match False`
* Get number of local groups: `Get-LocalGroup | measure`
* IP address: `Get-NetIPAddress`
* Get network listening ports: `Get-NetTCPConnection | Where-Object -Property State -Match Listen | measure`
* Remote address listening on local port`Get-NetTCPConnection | Where-Object -Property State -Match Listen`
* Get number of installed patches: `Get-Hotfix | measure`
* Get files containing API_KEY: `Get-ChildItem C:\* -Recurse | Select-String -pattern API_KEY`
* Get-ACL

## Resources

* <https://learnxinyminutes.com/>
