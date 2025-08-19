

$Sboot = [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI db).bytes) -match ‘Windows UEFI CA 2023’

Write-Host $Sboot

if ($Sboot -eq $true) {
    Write-Output "Windows UEFI CA 2023 certificate found." > C:\SecureBoot.txt
}