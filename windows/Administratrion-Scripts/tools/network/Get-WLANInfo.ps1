<#
.DESCRIPTION
#Various commands for obtaining windows wireless networking information:
    netsh wlan show all
    netsh wlan show interfaces
    netsh wlan show drivers
    netsh wlan show profiles
    netsh wlan export profile name="$PROFILE" key=clear folder=c:\
    netsh wlan delete profile *
    netsh wlan show profile name="$USER" key=clear
    netsh wlan show wlanreport
#To show all current certs on host:
    certutil -store -silent My & certutil -store -silent -user My
#>