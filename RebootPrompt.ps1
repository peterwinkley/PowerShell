#Create a function to check system uptime and output in hours.

function Get-Uptime {
   $os = Get-WmiObject win32_operatingsystem
   $LastBoot = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $UpTime = [math]::Floor($LastBoot.Totalhours)
   Write-Output $UpTime
}

$wshell = New-Object -ComObject Wscript.Shell

#use if then statement to check if the system uptime exceed 48hours and prompt the user to restart if it does. 

if ($UpTime > 48)
{
$Output = $wshell.Popup("Your computer has "$UpTime " hours uptime, please reboot at your earliest convenience to ensure the snooth operation of your system."



				

