 
<#
  .SYNOPSIS
  Reboot computer.

  .DESCRIPTION
  The reboot.ps1 script alow you easy reboot system same way as on Linux.

  .PARAMETER InputPath
   -pospone - pospone reboot for 30 secconds
   -force - force reboot  

  
  .EXAMPLE
  PS> .\reboot.ps1

  .EXAMPLE
  PS> .\reboot.ps1 -force

  .EXAMPLE
  PS> .\reboot -force -popsone

  .AUTHOR
    Written by: Jaroslav Mráz
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