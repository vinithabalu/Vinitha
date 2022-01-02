 get-item 'HKCU:\Software\Microsoft\Internet Explorer\settings' 
 get-childitem 'HKCU:\Software\Microsoft\Internet Explorer'  
 Write-Host  "Resetting IE To Default Settings" -ForegroundColor 'Red'   
 write-host "No IE process are currently running"  -ForegroundColor 'Green'   
 Write-Host "Reset button" -ForegroundColor 'Yellow'    
 & RunDll32.exe InetCpl.cpl,ResetIEtoDefaults  
 Write-Host "Launch Internet Explorer Now" -ForegroundColor 'Magenta'   
 Write-Host  "Resetting Done" -ForegroundColor 'Red'                 
