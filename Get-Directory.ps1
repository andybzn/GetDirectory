<#
    Script: Get-Directory.ps1
    Author: Dark-Coffee
    Version: 2.0
    Updated: 2020-02-11
    Description: dir, but directory listings only, and it actually shows folder sizes! :O 
#>

function Get-Directory {
    param (
        [Parameter(Mandatory=$false)][string]$Path = $PWD,
        [Parameter(Mandatory=$false)][string]$SizeIn = 'MB'
    )

    #Param Validation
    if('KB','MB','GB' -notcontains $SizeIn){Write-Error -Category InvalidArgument -Message 'SizeIn must be in: KB | MB | GB'; exit;}else{

    #Sort Sizes
    $SizeIn = $SizeIn.ToUpper()
    $SizeMeasure = "1$SizeIn"

    #Declare Expression
    $Size = @{n="Size ($SizeIn)";e={Get-ChildItem $_ -Recurse | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Sum | ForEach-Object {[Math]::Round(($_ / $SizeMeasure),2)}}}

    #Logic
    $Directories = Get-ChildItem $Path -Directory
    $DirectorySizes = Foreach($Directory in $Directories){$Directory | Select-Object Mode, LastWriteTime, $Size, Name}

    }
    #Return
    $DirectorySizes
}
