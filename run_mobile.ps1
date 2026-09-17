# Script to run Flutter app on mobile device
# Make sure you have an emulator running or a physical device connected first

Write-Host "Checking for available devices..." -ForegroundColor Cyan
flutter devices

Write-Host "`nAttempting to run on mobile device..." -ForegroundColor Cyan
Write-Host "If no device is found, please:" -ForegroundColor Yellow
Write-Host "1. Start an Android emulator from Android Studio, OR" -ForegroundColor Yellow
Write-Host "2. Connect a physical Android device with USB debugging enabled" -ForegroundColor Yellow
Write-Host "`nThen run this script again." -ForegroundColor Yellow
Write-Host "`nStarting Flutter run..." -ForegroundColor Green

flutter run




