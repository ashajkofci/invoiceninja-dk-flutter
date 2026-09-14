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
  "$ErrorActionPreference = 'Stop'; $packages = @(Get-ChildItem -LiteralPath $env:PACKAGE_DIR -Filter '*.msix'); if ($packages.Count -ne 1) { throw ('Expected exactly one MSIX beside this installer, found ' + $packages.Count + '.') }; $certificate = Join-Path $env:PACKAGE_DIR 'invoiceninja_flutter.cer'; if (-not (Test-Path -LiteralPath $certificate)) { throw 'invoiceninja_flutter.cer was not found beside this installer.' }; Import-Certificate -FilePath $certificate -CertStoreLocation 'Cert:\LocalMachine\TrustedPeople' | Out-Null; Add-AppxPackage -Path $packages[0].FullName -ForceApplicationShutdown -ForceUpdateFromAnyVersion; $installed = Get-AppxPackage -Name 'DKPROD.InvoiceNinja'; if (-not $installed -or $installed.Status -ne 'Ok') { throw 'The Invoice Ninja package was not registered successfully.' }; $legacy = Get-AppxPackage -Name 'InvoiceNinja.InvoiceNinja' | Where-Object { $_.PackageFamilyName -eq 'InvoiceNinja.InvoiceNinja_fxkeb4dgdm144' }; $legacy | Remove-AppxPackage; $manifest = Get-AppxPackageManifest -Package $installed.PackageFullName; $aumid = $installed.PackageFamilyName + '!' + $manifest.Package.Applications.Application.Id; Start-Process explorer.exe -ArgumentList ('shell:AppsFolder\' + $aumid)"

if errorlevel 1 (
  echo.
  echo Installation failed. See the error above.
  pause
  exit /b 1
)

echo.
echo Invoice Ninja was installed successfully and launched.
pause
