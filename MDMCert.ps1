#I didn't write this script.  Just hosting here for easy access, will give appropriate credit if I ever find out who did write it

$Path = 'HKLM:\Software\Microsoft\Enrollments'
$EnrollmentKey = Get-ChildItem "HKLM:\Software\Microsoft\Enrollments" -Recurse |
ForEach-Object { Get-ItemProperty $_.pspath } |
Where-Object { ($_.AADResourceID -eq "https://wip.mam.manage.microsoft.com/") } | Select-Object -ExpandProperty PSChildName
Remove-Item -Path $Path\$EnrollmentKey -Recurse -Force -EA SilentlyContinue -Verbose

