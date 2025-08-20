#Define Variables
$computerName = $env:COMPUTERNAME
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logFile = "C:\SecureBootCheck-$computerName.txt"

#Set Reg key to allow windows to update the secure boot certificate
Set-ItemProperty -Path “HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot” -Name “AvailableUpdates” -Value 0x40

#Create function to check that the secure boot key has been set correctly. 
function Test-SecureBootUpdateValue {
    param(
        $ExpectedValiue = "0x40"
    )

    try {
        $value = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot" -Name "AvailableUpdates").AvailableUpdates
        return ($value -eq $ExpectedValue)
    }
    catch {
        # If the key or value doesn't exist, return $false
        return $false
    }
}
#Check reg key is correct and run scehduled task to update secure boot if it is.
if (Test-SecureBootUpdateValue) {
#Check Reg Key is correct
    "$timeStamp : [$computerName] Registry value is set correctly." | Out-File -FilePath $logFile -Append
	Start-ScheduledTask -TaskName “\Microsoft\Windows\PI\Secure-Boot-Update"
	    "$timeStamp : [$computerName] Secure Boot update Job Successful." | Out-File -FilePath $logFile -Append
} else {
    "$timeStamp : [$computerName] Registry value is missing or incorrect." | Out-File -FilePath $logFile -Append
}

#Run Scheduled task to update the secure boot cert
#Start-ScheduledTask -TaskName “\Microsoft\Windows\PI\Secure-Boot-Update”

#Machine will need to rebooted twice to ensure this cert is applied.

