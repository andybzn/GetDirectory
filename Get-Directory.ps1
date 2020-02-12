<#
    Script: Get-Directory.ps1
    Author: Dark-Coffee
    Version: 2.6
    Updated: 2020-02-12
    Description: dir, but it actually shows folder sizes! :O 
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
    $Size = @{n="Size ($SizeIn)";e={Get-ChildItem $_ -Recurse | Where-Object Length -ne 0 | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Sum | ForEach-Object {[Math]::Round(($_ / $SizeMeasure),2)}}}

    #Logic
    $Items = Get-ChildItem -Path $Path
    $DirectoryListing = Foreach($Item in $Items){$Item | Select-Object Mode, LastWriteTime, $Size, Name}

    }
    #Return
    $DirectoryListing
}
