$s = New-PSSession -ComputerName 192.168.1.1 -Credential $Creds

Get-Module -ListAvailable -PSSession $s

Import-Module -Name ActiveDirectory -PSSession $s -Prefix  DC

Get-DCADUser -Filter *

Get-Credential -Store

Find-Credential

Remove-Credential -Target LegacyGeneric:target=MicrosoftPowerShell:user=Administrator@training.local