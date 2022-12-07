$users = Import-Csv -Path D:\Repos\Programmierung\Powershell\user.csv
$s = New-PSSession -ComputerName 192.168.1.1 -Credential $Creds
Get-Module -ListAvailable -PSSession $s
Import-Module -Name ActiveDirectory -PSSession $s -Prefix  DC

#"Given","Sur","Path","Department"

foreach ($user in $users) {
    $name = $user.Given + " " + $user.Sur
    $sam = $user.Given[0] + "." + $user.Sur
    New-DCADUser -GivenName $user.Given -Surname $user.Sur -Path $user.Path -Department $user.Department -Name $name -SamAccountName $sam -PasswordNeverExpires $true -PassThru
}

Get-DCADUser -Filter *