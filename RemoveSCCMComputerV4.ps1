<#
.NOTES
.AUTHOR:       Matthew Swanston
.VERSION:      V4.0
.DESCRIPTION 
     Script to remove a computer from SCCM without using SCCM Console.
.EXAMPLE 
     .\RemoveSCCMComputerV4.ps1 -Computername COMPUTER1
.PARAMETER Computername 
     The computer to Delete from SCCM
#> 

param ( 
    [Parameter(Mandatory = $True, 
               ValueFromPipeline = $True, 
               ValueFromPipelineByPropertyName = $True)] 
    [string]$Computername
)  

import-module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1"
CD BDC:
write-host "SCCM Module Imported"

		
write-host "Please verify Machine Details for Deletion are correct"
$results =Get-CMDevice -Name $Computername | Select-Object name, username , adsitename , ADLastLogonTime
$Results | FORMAT-LIST	
Remove-CMDevice -DeviceName $Computername -confirm
write-host "Script complete" $computername

CD c:\

# SIG # Begin signature block
