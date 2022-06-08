$VMPrefix = "MCDEV"
$VMId = -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
$VMName = $VMPrefix + "-" + $VMId

$VHDPath = "C:\Users\Public\Documents\Hyper-V\Virtual hard disks"

$ISOPath = "C:\Users\crawl\Downloads\Win11_EnglishInternational_x64v1.iso"

# Create the basic VM and settings
New-VM -Name $VMName -MemoryStartupBytes 4GB -NewVHDPath "$VHDPath\$VMName.vhdx" -NewVHDSizeBytes 45GB -Generation 2 -SwitchName "Default Switch"
Set-VM -Name $VMName -AutomaticCheckpointsEnabled $False -AutomaticCriticalErrorAction Pause -AutomaticStartAction Nothing -AutomaticStopAction TurnOff -CheckpointType Disabled -DynamicMemory -MemoryMinimumBytes 4GB -MemoryMaximumBytes 8GB -Notes "Mark's development environment" -ProcessorCount 2

# Setup TPM (needed for Windows Hello)
$owner = Get-HgsGuardian UntrustedGuardian
$kp = New-HgsKeyProtector -Owner $owner -AllowUntrustedRoot
Set-VMKeyProtector -VMName $VMName -KeyProtector $kp.RawData
Enable-VMTPM -VMName $VMName

# Enable virtualisation extensions (needed for WSL)
Set-VMProcessor -VMName $VMName -ExposeVirtualizationExtensions $true

# Connect the installation ISO as a DVD drive and set the boot order
Add-VMDvdDrive -VMName $VMName -Path $ISOPath
$vmDvdDrive = Get-VMDvdDrive -VMName $VMName
$vmHardDrive = Get-VMHardDiskDrive -VMName $VMName
Set-VMFirmware $VMName -BootOrder $vmDvdDrive, $vmHardDrive
