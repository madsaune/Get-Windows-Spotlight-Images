# Extract Windows Spotlight images
A Powershell script to extract Windows Spotlight images found in Windows 10.

## What is Windows Spotlight?
Windows Spotlight are a collection of images that are displayed on your lockscreen in Windows 10, if its enabled. These images will be automatically updated regularly by Windows.

Images are stored in `%USERPROFILE%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets` with a random string as filename and no file extension.

## What does this script do?
This script will extract all Windows Spotlight images that is stored on your computer and (by default) put them in `%USERPROFILE%\Pictures\Spotlight` as `.jpeg`.
It will only extract images that are larger or equal to 1920 width (aka ment for desktop).

## Setup
You can choose to run this script manually whenevery you want, but I recommend to set it up as a scheduled task.
