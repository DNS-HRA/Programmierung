$Switch = New-VMSwitch -Name "local" -SwitchType Internal

$VMParams = @{
    Name = "DC"
    MemoryStartupBytes = 2GB
    Generation = 2
    NewVHDPath = "D:\VMs\DC.vhdx"
    NewVHDSizeBytes = 20GB
    SwitchName = $Switch.Name
    BootDevice = "CD"
    Path = "D:\VMs"
}

$VM = New-VM @VMParams

$VM | Get-VMDvdDrive | Set-VMDvdDrive -Path "D:\VMs\SERVER_EVAL_x64FRE_de-de.iso"
$VM | Set-VMProcessor -Count 4
