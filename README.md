# Get-Directory


Install me from the PowerShell Gallery!
```
Install-Module GetDirectory
```

Alternatively, use this single-line command:
```
$PSModDir="$($env:PSModulePath|%{$_ -replace ";.*"})\GetDirectory\";if(!(Test-Path($PSModDir))){New-Item -Type Directory $PSModDir};Start-BitsTransfer 'https://raw.githubusercontent.com/dark-coffee/Get-Directory/master/GetDirectory.psm1' "$PSModDir\GetDirectory.psm1";Import-Module GetDirectory;
```




![Screen1](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory1.PNG)
![Screen2](https://shadow.coffee/assets/Github/Get-Directory/Get-Directory2.PNG)
