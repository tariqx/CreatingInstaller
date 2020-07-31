$svcName=$args[0]

# first find the service than stop it 
Get-Service -Name $svcName | Stop-Service

#$svcName = Get-Service -Name $svcName

sc.exe delete $svcName