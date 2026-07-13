#Requires -RunAsAdministrator

<#
    Windows 11 - Remove Xbox Game Bar & Disable GameDVR
    Author : 阿冷 Arlen
    Version: 1.0
#>

Clear-Host

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " Windows 11 Game Bar Removal Tool" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

#---------------------------------------------------
# Remove Xbox Game Bar
#---------------------------------------------------

Write-Host "[1/4] Removing Xbox Game Bar..." -ForegroundColor Yellow

try {
    Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage -ErrorAction Stop
    Write-Host "    Xbox Game Bar removed." -ForegroundColor Green
}
catch {
    Write-Host "    Xbox Game Bar is already removed or not installed." -ForegroundColor DarkYellow
}

#---------------------------------------------------
# Disable GameDVR
#---------------------------------------------------

Write-Host ""
Write-Host "[2/4] Disabling GameDVR..." -ForegroundColor Yellow

New-Item `
    -Path "HKCU:\System\GameConfigStore" `
    -Force | Out-Null

New-ItemProperty `
    -Path "HKCU:\System\GameConfigStore" `
    -Name "GameDVR_Enabled" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "    GameDVR disabled." -ForegroundColor Green

#---------------------------------------------------
# Disable App Capture
#---------------------------------------------------

Write-Host ""
Write-Host "[3/4] Disabling Game Capture..." -ForegroundColor Yellow

New-Item `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" `
    -Force | Out-Null

New-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" `
    -Name "AppCaptureEnabled" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "    Game Capture disabled." -ForegroundColor Green

#---------------------------------------------------
# Disable via Policy
#---------------------------------------------------

Write-Host ""
Write-Host "[4/4] Applying Local Policy..." -ForegroundColor Yellow

New-Item `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" `
    -Force | Out-Null

New-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" `
    -Name "AllowGameDVR" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "    Policy applied." -ForegroundColor Green

#---------------------------------------------------
# Finish
#---------------------------------------------------

Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host " Completed Successfully" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Xbox Game Bar has been removed." -ForegroundColor White
Write-Host "GameDVR has been disabled." -ForegroundColor White
Write-Host "Overlay recording has been disabled." -ForegroundColor White
Write-Host ""
Write-Host "A system restart is recommended." -ForegroundColor Yellow
Write-Host ""

$restart = Read-Host "Restart now? (Y/N)"

if ($restart -match '^[Yy]$') {
    Restart-Computer
}
