<#
    Module: GetDirectory.psm1
    Author: Dark-Coffee
    Version: 3.0
    Updated: 2020-10-14
    Description: dir, but it actually shows folder sizes! :O 
#>

function Get-Directory {
    param (
        [Parameter(Mandatory=$false)][string]$Path = $PWD,
        [Parameter(Mandatory=$false)][string]$SizeIn = 'MB'
    )

    #Param Validation
    if('KB','MB','GB' -notcontains $SizeIn){Write-Error -Category InvalidArgument -Message 'SizeIn must be in: KB | MB | GB'}else{

    #Sort Sizes
    $SizeIn = $SizeIn.ToUpper()
    $SizeMeasure = "1$SizeIn"

    #Declare Expression
    $Size = @{n="Size ($SizeIn)";e={$_ | Get-ChildItem -Recurse | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Sum | ForEach-Object {[Math]::Round(($_ / $SizeMeasure),2)}}}
    $Size2 = @{n="Size ($SizeIn)";e={$_ | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Sum | ForEach-Object {[Math]::Round(($_ / $SizeMeasure),2)}}}

    #Directory Logic
    $Directories = Get-ChildItem -Path $Path -Directory
    $DirectoryOutput = Foreach($Directory in $Directories){$Directory | Select-Object Mode, LastWriteTime, $Size, Name | Sort-Object Name}

    #Item Logic
    $Files = Get-ChildItem -Path $Path -File
    $FileOutput = Foreach($File in $Files){$File | Select-Object Mode, LastWriteTime, $Size, Name | Sort-Object Name}
    }
    
    $DirectoryListing = $DirectoryOutput,$FileOutput
    #Return
    $DirectoryListing
}

Export-ModuleMember -Function Get-Directory