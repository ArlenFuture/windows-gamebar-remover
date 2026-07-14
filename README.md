# Windows 11 Game Bar Remover

A PowerShell script to remove Xbox Game Bar and disable Windows GameDVR features.

Designed for users who don't use Xbox Game Bar, game recording, or Windows gaming features.

## Features

* Remove Xbox Game Bar
* Disable GameDVR
* Disable Game Capture
* Apply GameDVR Local Policy
* Restore GameDVR settings
* Restore Windows GameDVR policy
* Open Microsoft Store to reinstall Xbox Game Bar

## Requirements

* Windows 11
* PowerShell
* Administrator privileges

## Usage

Run **PowerShell as Administrator**.

### Remove Xbox Game Bar

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\Remove-GameBar.ps1
```

This script will:

* Remove Xbox Game Bar
* Disable GameDVR
* Disable Game Capture
* Apply a local policy to disable GameDVR

Restart Windows after completion.

### Restore Xbox Game Bar

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\Restore-GameBar.ps1
```

This script will:

* Re-enable GameDVR
* Re-enable Game Capture
* Restore the Windows GameDVR policy to its default state
* Open the Microsoft Store page for Xbox Game Bar installation

After running the restore script, install Xbox Game Bar from the Microsoft Store if it is not already installed, then restart Windows.

## Warning

These scripts modify Windows system settings and registry values.

Please review the source code before running.

## License

MIT License
