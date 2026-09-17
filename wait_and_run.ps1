# Script to wait for mobile device and run Flutter app
$env:ANDROID_HOME = "C:\Users\Admin\AppData\Local\Android\Sdk"
$env:PATH += ";$env:ANDROID_HOME\platform-tools"

Write-Host "=== Waiting for Android Device ===" -ForegroundColor Green
Write-Host "Please ensure:" -ForegroundColor Yellow
Write-Host "1. USB Debugging is enabled (Settings > Developer Options)" -ForegroundColor White
Write-Host "2. USB mode is set to File Transfer or MTP" -ForegroundColor White
Write-Host "3. You've authorized USB debugging on your phone" -ForegroundColor White
Write-Host ""
Write-Host "Checking for device every 3 seconds..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to cancel" -ForegroundColor Gray
Write-Host ""

$maxAttempts = 60
$attempt = 0

while ($attempt -lt $maxAttempts) {
    $attempt++
    $devices = adb devices | Select-String -Pattern "device$" | Measure-Object
    
    if ($devices.Count -gt 0) {
        Write-Host ""
        Write-Host "Device detected! Running Flutter app..." -ForegroundColor Green
        flutter devices
        Write-Host ""
        Write-Host "Starting app..." -ForegroundColor Green
        flutter run
        break
    }
    
    if ($attempt % 5 -eq 0) {
        $msg = "Still waiting... attempt $attempt of $maxAttempts"
        Write-Host $msg -ForegroundColor Yellow
    }
    
    Start-Sleep -Seconds 3
}

if ($attempt -ge $maxAttempts) {
    Write-Host ""
    Write-Host "Timeout: Device not detected after $maxAttempts attempts" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting:" -ForegroundColor Yellow
    Write-Host "1. Check USB cable connection" -ForegroundColor White
    Write-Host "2. Try a different USB port" -ForegroundColor White
    Write-Host "3. Install or update USB drivers for your phone" -ForegroundColor White
    Write-Host "4. Restart ADB server" -ForegroundColor White
}
