# bria install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://counterpath.s3.amazonaws.com/downloads/Bria_5.8.5_105447.exe'
$checksumPackage = '82feabfc717d5e07639ff1141f7d4aef7c1e53cce97e68e792878b8f45bc760c276770765232764d62cd0f6552511bdf3a3d287ad33aa51245730a2bd412b67f'
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
