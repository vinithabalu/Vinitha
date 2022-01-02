  $ServerListFile = "C:\Users\Administrator.DEMO\Desktop\server.txt"  
  $servers = Get-Content -Path $ServerListFile -ErrorAction SilentlyContinue  
  foreach($server in $servers)  
  {  
  $disk=Get-WmiObject -Class Win32_LogicalDisk -ComputerName $server  |Select-Object -Property DeviceID, @{Label='FreeSpace (Gb)'; expression={($_.FreeSpace/1GB).ToString('F2')}},@{Label='Total (Gb)'; expression={($_.Size/1GB).ToString('F2')}},@{label='FreePercent'; expression={((($_.freespace / $_.size) * 100)).ToString('F2')}}  
  $disk  
  $array=$disk.'freepercent'  
  foreach($a in $array)  
  {  
  if(([int]$a -lt 50) -and ($a -ne $null))  
  {  
  write-host "$server free percentage =$a"  
  $Target = "\\$server\C$\windows\Temp"  
  $List = Get-ChildItem $Target -Recurse |remove-item -recurse -force -erroraction silentlycontinue  
  } } }    
