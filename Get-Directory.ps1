<#
    Script: Get-Directory.ps1
    Author: Dark-Coffee
    Version: 1.0
    Updated: 2020-02-05
    Description: dir, but directory listings only, and it actually shows folder sizes! :O 
#>

function Get-Directory {
    param (
        [Parameter(Mandatory=$false)][string]$Path = $PWD
    )

    #Declare Expression
    $Size = @{n='Size (MB)';e={Get-ChildItem $_ -Recurse | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Sum | ForEach-Object {[Math]::Round(($_ / 1MB),2)}}} 

    #Logic
    $Directories = Get-ChildItem $Path -Directory
    $DirectorySizes = Foreach($Directory in $Directories){$Directory | Select-Object Mode, LastWriteTime, $Size, Name}

    $DirectorySizes
}
