 $path=read-host "Enter the path to get a list of servers" 
 try 
 { 
 $servers= Get-Content $path  
 foreach($server in $servers) 
 {  
 try 
 { 
 invoke-command -ComputerName $server -ScriptBlock {   
 $quserResult = quser /server  
 $quserResult 
 $quserRegex = $quserResult | ForEach-Object -Process { $_ -replace '\s{2,}',',' }  
 $quserRegex 
 $quserObject = $quserRegex | ConvertFrom-CSV  
 $quserObject   
 if ($quserObject.'LOGON TIME' -lt (get-date).AddDays(3)) 
 {  
 logoff $quserObject.ID    
 }  
 else 
 {   
 write-host "No user is active more than three days"}   } -ErrorAction stop}     
 catch [System.Management.Automation.RemoteException]     
 {   
 write-host " In $server no active user present" -ForegroundColor red}}}   
 catch [System.Management.Automation.ItemNotFoundException]    
 {         
 write-host "The path was not found" -ForegroundColor Red       
 }              
 catch [UnauthorizedAccessException]  {                  
 write-host "The access was denied to that path" -ForegroundColor Red   
 }                   
