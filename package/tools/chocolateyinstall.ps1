# bria install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://secure.counterpath.com/Downloads/Bria_5.8.1_102005.exe'
$checksumPackage = '7303d0a3a43a2c12b575bff11496ddb8ee27bd01b0f64bf1c67bdd010c1098a8e5ca9b19e4c6b740c6ebfc1b5f354d4ce5976f96e8d57e9742e52f62bde98cea'
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
