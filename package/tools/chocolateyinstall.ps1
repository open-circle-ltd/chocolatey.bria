# bria install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://secure.counterpath.com/Downloads/Bria_5.6.2_99262.exe'
$checksumPackage = 'b34cfcefed13bf05980e4f0b6a2cf3c2a56f0738fcbd82e34d837d98c40a9e6e91514c5d368b4c703f4e46edb5d653bde4ea6d30f7a2aada0d84407589425688'
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
