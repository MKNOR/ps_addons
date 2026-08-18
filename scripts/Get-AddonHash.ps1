<#
.SYNOPSIS
    Computes the SHA-256 hash and byte size of an addon zip, formatted for addons.json.

.EXAMPLE
    .\Get-AddonHash.ps1 -Path C:\Addons\SkyreachUI.zip
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$Path
)

if (-not (Test-Path $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$hash = (Get-FileHash -Path $Path -Algorithm SHA256).Hash.ToLower()
$size = (Get-Item $Path).Length

Write-Host "sha256: $hash"
Write-Host "size:   $size"
