Function Get-SpotlightFiles {
    If(-not (Test-Path "$env:USERPROFILE\Pictures\Spotlight")) {
        New-Item "$env:USERPROFILE\Pictures\Spotlight" -ItemType Directory
    }
    Get-ChildItem "$env:USERPROFILE\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" | ForEach-Object {
        $NewFilename = $_.Name + ".jpeg"
        # If(Test-Path (Join-Path "$env:USERPROFILE\Pictures\Spotlight" $NewFilename)) {
        #     $NewFilename = $_.Name + "(2).jpeg"
        # }
        Copy-Item $_.Fullname (Join-Path "$env:USERPROFILE\Pictures\Spotlight" $NewFilename)
    }
}

Function Remove-UnwantedSpotlightImages {
    $ImagesToMove = @()
    $AllImages = Get-ChildItem "$env:USERPROFILE\Pictures\Spotlight\*.jpeg"
    $AllImages | ForEach-Object {
        $image = New-Object System.Drawing.Bitmap $_.FullName
        If($image.Width -ne 1920) {
            $ImagesToMove += $_.FullName
        }
        $image.Dispose()
    }

    $ImagesToMove | Remove-Item
}

Add-Type -AssemblyName System.Drawing
Get-SpotlightFiles
Remove-UnwantedSpotlightImages
