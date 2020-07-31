$svcName=$args[0]
$exePath=$args[1]
$displayName = $args[2]
$Description = $args[3]

$params = @{
  Name = $svcName
  BinaryPathName = $exePath
  DisplayName = $displayName
  StartupType = "Manual" #default
  Description = $Description
}


#creates a service based on the params passed in.
New-Service @params

#make sure service is installed first
Get-Service -Name $params.Name | Start-Service
