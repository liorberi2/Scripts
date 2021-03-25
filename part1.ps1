New-Item "c:\mytask.ps1" -force

$TxtFilePath = "c:\mytask.ps1"

Start-Process notepad.exe $TxtFilePath 
  
Add-Content "c:\mytask.ps1" "I love the bootcamp!"

Get-Content "c:\mytask.ps1" 

  

