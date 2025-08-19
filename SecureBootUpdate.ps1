#Set Reg key to allow windows to update the secure boot certificate
Set-ItemProperty -Path “HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot” -Name “AvailableUpdates” -Value 0x40

#Run Scheduled task to update the secure boot cert
Start-ScheduledTask -TaskName “\Microsoft\Windows\PI\Secure-Boot-Update”

#Machine will need to rebooted twice to ensure this cert is applied.

