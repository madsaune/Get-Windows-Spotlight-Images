<#

.SYNOPSIS

    A script for extracting Windows Spotlight images.

.DESCRIPTION

    This script extracts Windows Spotlight images that appears on your lockscreen.
    Its recommended you run this script as a scheduled job every day.

.NOTES

    File Name:  Get-AutoHelp.ps1
    Author:     Mads Moi-Aune <mads@moiaune.no>

.LINK

    Github Repo: https://github.com/madsaune/Get-Windows-Spotlight-Images

.EXAMPLE

    ./Get-WindowsspotlightImages.ps1 -OutputFolder $env:USERPROFILE\Pictures\Spotlight

#>

Param (
    [String] $OutputFolder = "$env:USERPROFILE\Pictures\Spotlight"
)

Add-Type -AssemblyName System.Drawing


If(-not (Test-Path $OutputFolder)) {
    New-Item $OutputFolder -ItemType Directory | Out-Null
}

Get-ChildItem "$env:USERPROFILE\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" | ForEach-Object {

    $NewFilename = $_.Name + ".jpeg"
    If(-not (Test-Path (Join-Path $OutputFolder $NewFilename))) {
        Copy-Item $_.Fullname (Join-Path $OutputFolder $NewFilename)
    }

}

$ImagesToRemove = @()
$AllImages = Get-ChildItem (Join-Path $OutputFolder "*.jpeg")
$AllImages | ForEach-Object {
    $image = New-Object System.Drawing.Bitmap $_.FullName
    If(-not ($image.Width -ge 1920)) {
        $ImagesToRemove += $_.FullName
    } else {
    }
    $image.Dispose()
}

$ImagesToRemove | Remove-Item