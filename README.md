# Get-Directory


Install me with this single-line command:
```
$PSModDir="$($env:PSModulePath|%{$_ -replace ";.*"})\Get-Directory\";if(!(Test-Path($PSModDir))){New-Item -Type Directory $PSModDir};Start-BitsTransfer 'https://raw.githubusercontent.com/dark-coffee/Get-Directory/master/Get-Directory.psm1' "$PSModDir\Get-Directory.psm1";Import-Module Get-Directory;
```

or this multi-line command:
```
$PSModDir = "$($env:PSModulePath | % {$_ -replace ";.*"})\Get-Directory\"
if(!(Test-Path ($PSModDir))){
    New-Item -Type Directory $PSModDir
    }
Start-BitsTransfer 'https://raw.githubusercontent.com/dark-coffee/Get-Directory/master/Get-Directory.psm1' "$PSModDir\Get-Directory.psm1"
Import-Module Get-Directory
```


![Screen1](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory1.PNG)
![Screen2](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory2.PNG)