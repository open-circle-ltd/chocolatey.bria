# bria uninstall

$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Import-Module -Name "$($toolsDir)\helpers.ps1"
