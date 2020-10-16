# Get-Directory


Install me from the PowerShell Gallery!
```
Install-Module GetDirectory
```

Alternatively, use this hackier single-line command to get this module from Github!
```
$PSModDir="$($env:PSModulePath|%{$_ -replace ";.*"})\GetDirectory\";if(!(Test-Path($PSModDir))){New-Item -Type Directory $PSModDir};Start-BitsTransfer 'https://raw.githubusercontent.com/dark-coffee/Get-Directory/master/GetDirectory.psm1' "$PSModDir\GetDirectory.psm1";Import-Module GetDirectory;
```




![Screen1](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory1.PNG)
![Screen2](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory2.PNG)

## Module Notes
* On MacOS, recursively polling all the derectories (how I calculate size) will prompt for access to certain dirs (contacts, reminders, desktop etc.)
* Dirs that are empty, or are symlinks will return a null or blank value for size.


## Get-Help 

    .SYNOPSIS
    Extends the Dir command to include folder sizes.

    .DESCRIPTION
    Extends the Dir command to include folder sizes.
    Will procvide the standard Dir output, with a modified size column.

    .PARAMETER Path
    Specifies the path to run the command inside, else defaults to the current working directory.

    .PARAMETER SizeIn
    If specified (from KB,MB,GB) will display the folder size in that measurement.

    .INPUTS
    This module does not accept pipeline input.

    .OUTPUTS
    Standard output of Dir command, with a modified Size([unit]) column.

    .EXAMPLE
    PS>  Get-Directory

    Mode  LastWriteTime       Size (MB) Name
    ----  -------------       --------- ----
    d---- 04/06/2020 19:44:45     35.64 Applications
    d---- 14/10/2020 20:29:38         0 Desktop
    d---- 14/10/2020 20:22:06   5181.69 Documents
    d---- 14/10/2020 20:12:51 163949.76 Downloads

    .EXAMPLE
    PS>  Get-Directory -SizeIn GB

    Mode  LastWriteTime       Size (GB) Name
    ----  -------------       --------- ----
    d---- 04/06/2020 19:44:45      0.03 Applications
    d---- 14/10/2020 20:29:38         0 Desktop
    d---- 14/10/2020 20:22:06      5.06 Documents
    d---- 14/10/2020 20:12:51    160.11 Downloads

    .EXAMPLE
    PS> Get-Directory -Path 'E:\Steam'

    Mode   LastWriteTime       Size (MB) Name     
    ----   -------------       --------- ----     
    d----- 08/06/2020 18:02:51 273572.47 steamapps
    -a---- 10/09/2020 08:05:38      0.41 steam.dll
