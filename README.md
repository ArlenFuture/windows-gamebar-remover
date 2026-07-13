# Windows 11 Game Bar Remover

A PowerShell script to remove Xbox Game Bar and disable Windows GameDVR features.

Designed for users who don't use Xbox Game Bar, game recording, or Windows gaming features.

## Features

* Remove Xbox Game Bar
* Disable GameDVR
* Disable Game Capture
* Apply GameDVR Local Policy

## Requirements

* Windows 11
* PowerShell
* Administrator privileges

## Usage

Run PowerShell as Administrator:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\Remove-GameBar.ps1
```

Restart Windows after completion.

## Warning

This script modifies Windows system settings.

Please review the source code before running.

## License

MIT License
