#Requires -RunAsAdministrator

<#
    Windows 11 - Restore Xbox Game Bar & Enable GameDVR
    Author : 阿冷 Arlen
    Version: 1.0
#>

Clear-Host

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " Windows 11 Game Bar Restore Tool" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

#---------------------------------------------------
# Enable GameDVR
#---------------------------------------------------

Write-Host "[1/4] Enabling GameDVR..." -ForegroundColor Yellow

New-Item `
    -Path "HKCU:\System\GameConfigStore" `
    -Force | Out-Null

New-ItemProperty `
    -Path "HKCU:\System\GameConfigStore" `
    -Name "GameDVR_Enabled" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "    GameDVR enabled." -ForegroundColor Green

#---------------------------------------------------
# Enable App Capture
#---------------------------------------------------

Write-Host ""
Write-Host "[2/4] Enabling Game Capture..." -ForegroundColor Yellow

New-Item `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" `
    -Force | Out-Null

New-ItemProperty `
    -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" `
    -Name "AppCaptureEnabled" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "    Game Capture enabled." -ForegroundColor Green

#---------------------------------------------------
# Remove Local Policy
#---------------------------------------------------

Write-Host ""
Write-Host "[3/4] Restoring Local Policy..." -ForegroundColor Yellow

if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR") {

    Remove-ItemProperty `
        -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" `
        -Name "AllowGameDVR" `
        -ErrorAction SilentlyContinue

    Write-Host "    Local Policy restored." -ForegroundColor Green
}
else {
    Write-Host "    Local Policy already restored." -ForegroundColor DarkYellow
}

#---------------------------------------------------
# Open Microsoft Store
#---------------------------------------------------

Write-Host ""
Write-Host "[4/4] Opening Microsoft Store..." -ForegroundColor Yellow

Start-Process "ms-windows-store://pdp/?productid=9NZKPSTSNW4P"

Write-Host "    Microsoft Store opened." -ForegroundColor Green

#---------------------------------------------------
# Finish
#---------------------------------------------------

Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host " Restore Completed" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

Write-Host "GameDVR has been enabled." -ForegroundColor White
Write-Host "Game Capture has been enabled." -ForegroundColor White
Write-Host "Local Policy has been restored." -ForegroundColor White
Write-Host ""
Write-Host "Install Xbox Game Bar from the Microsoft Store if it is not already installed." -ForegroundColor White
Write-Host ""
Write-Host "A system restart is recommended." -ForegroundColor Yellow
Write-Host ""

$restart = Read-Host "Restart now? (Y/N)"

if ($restart -match '^[Yy]$') {
    Restart-Computer
}
