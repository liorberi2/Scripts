param ([Parameter(Mandatory=$true)][String]$TaskName,[Parameter(Mandatory=$true)][int]$WaitSeconds) 

  

Function Change-TaskStatus (){  #“Change-TaskStatus” which disables or enables a task in task scheduler by name.

    if( (Get-ScheduledTask | Where TaskName -eq $TaskName ).State -eq "Ready"){ 

            Disable-ScheduledTask -TaskName $TaskName} 

        else{ 

            Enable-ScheduledTask -TaskName $TaskName 

            } 

} 
 

Function Create-Task (){    #function 1 create-task on task scheduler

  

$ScheduledTaskActionParams = @{  #TASK INFO + path

    Execute  = "PowerShell.exe" 

    Argument = "-File C:\mytask.ps1"  

} 

  

$params = @{    #Create a task with the “CreateTask” function that run every 1 minutes

    Once = $true 

    At = (Get-Date) 

    RepetitionInterval = (New-TimeSpan -Minutes 1)
     

} 
 

  

$registerTaskParameters = @{   #

    Trigger   = New-ScheduledTaskTrigger  @params 

    TaskName  =  $TaskName 

    Action    = New-ScheduledTaskAction @ScheduledTaskActionParams
     

    } 

  
 Start-Sleep -Seconds 5 # suspends the activity in a script for 5 seconds

Register-ScheduledTask @registerTaskParameters -Force 

} 

  

Function Get-AllTasks (){  #“Get-AllTasks” which get a list of all your tasks running on task scheduler.

  

$list=Get-ScheduledTask | Get-ScheduledTaskInfo 

Foreach($i in $list){ 

echo $i.TaskName  #output of Task name

} 

} 

Get-AllTasks #Get all task’s full names

  

  

 

    
