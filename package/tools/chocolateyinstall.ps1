# bria install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://secure.counterpath.com/Downloads/Bria_5.8.0_101916.exe'
$checksumPackage = 'a3b317a011e3cda662a7f71be1fc484e440c3d5e18b18ec5481ddc37408b75b0c06d40587bf78d9cd7445d39fd887f8a0da8e6ad2dc82aa99d9e8c0340625223'
$checksumTypePackage = 'SHA512'

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $urlPackage
  checksum       = $checksumPackage
  checksumType   = $checksumTypePackage
  silentArgs     = '--silent --AcceptEULA=Yes'
}

Install-ChocolateyPackage @packageArgs

if ($PackageParameters.RemoveDesktopIcons) {
    Remove-DesktopIcons -Name "Bria 5" -Desktop "Public"
}

if ($PackageParameters.CleanStartmenu) {
	Remove-FileItem `
		-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CounterPath Corporation Bria 5"
  Install-ChocolateyShortcut `
    -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bria.lnk" `
    -TargetPath "C:\ProgramData\CounterPath\Bria 5\Current\Bria5.exe" `
    -WorkDirectory "C:\ProgramData\CounterPath\Bria 5\Current"
}	
