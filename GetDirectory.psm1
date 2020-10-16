<#
    Module: GetDirectory.psm1
    Author: Dark-Coffee
    Version: 3.2
    Updated: 2020-10-15
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

    <#
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

    #>
}

Export-ModuleMember -Function Get-Directory
