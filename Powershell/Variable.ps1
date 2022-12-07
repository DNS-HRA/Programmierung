# Variante 1
Write-Output("Variante 1")
$Logs = Get-WinEvent -ListLog Application, 'Windows Powershell', System
$logs.recordCount

# Variante 2
Write-Output("Variante 2")
(Get-WinEvent -ListLog Application, 'Windows Powershell', System).recordCount

# Variante 3
Write-Output("Variante 3")
Get-WinEvent -ListLog Application, 'Windows Powershell', System | Select-Object -ExpandProperty recordCount