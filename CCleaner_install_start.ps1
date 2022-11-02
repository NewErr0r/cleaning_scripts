# установка CCleaner
mkdir C:\CCleanerInstall
Invoke-WebRequest -Uri "https://download.ccleaner.com/ccsetup578.exe" -OutFile C:\CCleanerInstall\ccsetup526.exe
Start-Process -FilePath "c:\CCleanerInstall\ccsetup526.exe" -ArgumentList "/S"
Start-Sleep -s 20
rm -R -Force C:\CCleanerInstall
write-Host 'CCleaner is installed successfully!' -ForegroundColor Green

# запуск чистки при помощи CCleaner
$path32 = Join-Path "$env:ProgramFiles(x86)" "Ccleaner"
$path64 = Join-Path $env:ProgramFiles "Ccleaner"

if(Test-Path $path32) {
    $exePath = Join-Path $path32 "Ccleaner.exe"
    & $exePath "/auto"
} elseif (Test-Path $path64) {
    $exePath = Join-Path $path64 "Ccleaner.exe"
    & $exePath "/auto"
}