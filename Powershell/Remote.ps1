$Creds =  Get-Credential -UserName Administrator@training.local

Invoke-Command -VMName DC -Credential $Creds -ScriptBlock {

    #Computer Umbennen
    #Rename-Computer -NewName "DC" -Restart

    ############# Achtung - Reboot ##################################

    <##COmputer Netzwerkeinstellungen
    $adapter = Get-NetAdapter
    New-NetIPAddress -IPAddress 192.168.1.1 -PrefixLength 24 -InterfaceIndex $adapter.ifIndex
    Set-DnsClientServerAddress -ServerAddresses "8.8.8.8" -InterfaceIndex $adapter.ifIndex
    #>

    #Ping Firewall Regel freischalten
    #Enable-NetFirewallRule -Name FPS-ICMP4-ERQ-In #enable ping
    #Set-Item WSMan:\localhost\Client\TrustedHosts -Value *

    #ADDS Rolle installieren
    #Get-WindowsFeature  #zum prüfen welche Rollen es gibt 
    #Install-WindowsFeature -Name ad-domain-services -IncludeAllSubFeature -IncludeManagementTools

    <# DC 'PRomo' durchführen
    $PW = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force

    $SplattedParams = @{
        SafeModeAdministratorPassword = $PW
        SysvolPath = "C:\Windows\SYSVOL"
        DatabasePath = "C:\Windows\NTDS"
        LogPath = "C:\Windows\NTDS"
        DomainName = "training.local"
        DomainNetbiosName = "TRAINING"
        DomainMode = "WinThreshold"
        ForestMode = "WinThreshold"
        InstallDns = $true
        CreateDnsDelegation = $false
        NoRebootOnCompletion = $false
    }

    Install-ADDSForest @SplattedParams
    #>

    ############# Achtung - Reboot ##################################
    <#
    $TarOU = New-ADOrganizationalUnit -Name Content -Path "DC=Training,DC=local" -PassThru

    $PW = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force
    $User = New-ADUser -Name "Bernd.Beispiel" -Department "Marketing" -AccountPassword $pw `
    -EmailAddress "Bernd.Beispiel@training.local" -UserPrincipalName "Bernd.Beispiel@training.local" `
    -SamAccountName "Bernd.Beispiel" -Path $TarOU.DistinguishedName -PassThru

    $Group = New-ADGroup -DisplayName "User" -Name "User" -GroupCategory Security `
    -GroupScope Global -Path $TarOU.DistinguishedName -PassThru

    Add-ADGroupMember -Identity $Group -Members $User
    #>
    Test-Connection 192.168.1.2
}