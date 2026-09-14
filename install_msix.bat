@echo off
setlocal EnableExtensions

fltmc >nul 2>&1
if errorlevel 1 (
  echo Requesting administrator access...
  powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

set "PACKAGE_DIR=%~dp0"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop'; $packages = @(Get-ChildItem -LiteralPath $env:PACKAGE_DIR -Filter '*.msix'); if ($packages.Count -ne 1) { throw ('Expected exactly one MSIX beside this installer, found ' + $packages.Count + '.') }; $certificate = Join-Path $env:PACKAGE_DIR 'invoiceninja_flutter.cer'; if (-not (Test-Path -LiteralPath $certificate)) { throw 'invoiceninja_flutter.cer was not found beside this installer.' }; Import-Certificate -FilePath $certificate -CertStoreLocation 'Cert:\LocalMachine\TrustedPeople' | Out-Null; Add-AppxPackage -Path $packages[0].FullName"

if errorlevel 1 (
  echo.
  echo Installation failed. See the error above.
  pause
  exit /b 1
)

echo.
echo Invoice Ninja was installed successfully.
pause

