New-Item "c:\mytask.ps1" -force  #file creator

$TxtFilePath = "c:\mytask.ps1"   #configure TxtFilePath  

Start-Process notepad.exe $TxtFilePath  # start notepad
  
Add-Content "c:\mytask.ps1" "I love the bootcamp!" # add contenet to notepad

Get-Content "c:\mytask.ps1"  # get contect from the file created

  

