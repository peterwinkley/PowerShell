#once the secure boot script has been run to update the secure boot db, the following script can be used to check that the db has been updated correctly.  Boolean output


[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI db).bytes) -match ‘Windows UEFI CA 2023’
