<# Script p/ Instalar Puppet no Windows #>

$sys64 = [Environment]::Is64BitOperatingSystem
if($sys64 -eq "True"){ Write-Host "Sistema Operaciona x64" -ForegroundColor Green 
$file = "puppet-agent-x64-latest.msi" }
else {  Write-Host "Sistema Operaciona x86" -ForegroundColor Red 
$file = "puppet-agent-x86-latest.msi" }
$url = "http://downloads.puppetlabs.com/windows/puppet6/$file"
$output = "$PSScriptRoot\$file"

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
msiexec.exe /i "$PSScriptRoot\$file" /quiet /qn /norestart PUPPET_MASTER_SERVER=gconf.eitisolucoes.com.br INSTALLDIR=C:\Puppet
