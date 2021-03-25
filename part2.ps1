﻿param ([Parameter(Mandatory=$true)][String]$TaskName,[Parameter(Mandatory=$true)][int]$WaitSeconds) 

  

Function Change-TaskStatus (){ 

    if( (Get-ScheduledTask | Where TaskName -eq $TaskName ).State -eq "Ready"){ 

            Disable-ScheduledTask -TaskName $TaskName} 

        else{ 

            Enable-ScheduledTask -TaskName $TaskName 

            } 

} 
 

Function Create-Task (){ 

  

$ScheduledTaskActionParams = @{ 

    Execute  = "PowerShell.exe" 

    Argument = "-File C:\mytask.ps1" 

} 

  

$params = @{ 

    Once = $true 

    At = (Get-Date) 

    RepetitionInterval = (New-TimeSpan -Minutes 1)
     

} 
 

  

$registerTaskParameters = @{ 

    Trigger   = New-ScheduledTaskTrigger  @params 

    TaskName  =  $TaskName 

    Action    = New-ScheduledTaskAction @ScheduledTaskActionParams
     

    } 

  
 Start-Sleep -Seconds 5

Register-ScheduledTask @registerTaskParameters -Force 

} 

  

Function Get-AllTasks (){ 

  

$list=Get-ScheduledTask | Get-ScheduledTaskInfo 

Foreach($i in $list){ 

echo $i.TaskName 

} 

} 

Get-AllTasks 

  

  

 

    