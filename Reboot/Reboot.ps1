 

<#PSScriptInfo

.VERSION 1.0

.GUID 591ad953-a301-4926-a8e7-b1a47d00ea60

.AUTHOR Jaroslav Mráz

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI
  https://github.com/jaroslavmraz/chocolatey/tree/main/Reboot


.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA
<# 

.DESCRIPTION 
   The reboot.ps1 script alow you easy reboot system same way as on Linux. 

   
.SYNOPSIS
  Reboot computer.

.PARAMETER InputPath
   -pospone - pospone reboot for 30 secconds
   -force - force reboot  

  
.EXAMPLE
  PS> .\reboot.ps1 -pospone -force
 
#> 






[CmdLetBinding()]
Param(
    [parameter(Mandatory = $false)]
    [switch]$force,          
    [switch]$pospone  
)

if ($force) {
   
    $Global:forcereboot = "/f"
}

else {

}

if ($pospone) {
    $Global:posponereboot = "/t 30"

}
else {
    $Global:posponereboot = "/t 0"
}

Invoke-Expression -Command "shutdown.exe /r $Global:posponereboot $Global:forcereboot"