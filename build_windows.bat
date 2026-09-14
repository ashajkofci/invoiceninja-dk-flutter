@echo off
setlocal EnableExtensions

cd /d "%~dp0"

set /p REQUIRED_FLUTTER=<.flutter-version
set "FLUTTER_VERSION="
for /f "tokens=2" %%V in ('flutter --version 2^>nul ^| findstr /b /c:"Flutter "') do set "FLUTTER_VERSION=%%V"

if not defined FLUTTER_VERSION (
  echo ERROR: flutter was not found on PATH.
  exit /b 1
)

if not "%FLUTTER_VERSION%"=="%REQUIRED_FLUTTER%" (
  echo WARNING: this repo is pinned to Flutter %REQUIRED_FLUTTER% but found %FLUTTER_VERSION% on PATH.
)

if not exist "lib\.env.dart" (
  echo ==^> Creating lib\.env.dart from lib\.env.dart.example
  copy /y "lib\.env.dart.example" "lib\.env.dart" >nul || exit /b 1
)

echo ==^> Installing Flutter dependencies
call flutter pub get || exit /b 1

echo ==^> Generating built_value code
call dart run build_runner build --delete-conflicting-outputs || exit /b 1

echo ==^> Building Windows release executable
call flutter build windows --release || exit /b 1

set "OUTPUT_DIR=%CD%\build\windows\x64\runner\Release"
set "MSIX_PATH=%OUTPUT_DIR%\invoiceninja_flutter.msix"
set "CERT_PATH=%OUTPUT_DIR%\invoiceninja_flutter.cer"

echo ==^> Building MSIX package
call dart run msix:create --build-windows false --install-certificate false --output-path "%OUTPUT_DIR%" || exit /b 1

if not exist "%MSIX_PATH%" (
  echo ERROR: Expected MSIX was not created at "%MSIX_PATH%".
  exit /b 1
)

echo ==^> Exporting the matching public certificate beside the MSIX
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
  "$signature = Get-AuthenticodeSignature -LiteralPath $env:MSIX_PATH; if (-not $signature.SignerCertificate) { throw 'The MSIX does not contain a signing certificate.' }; Export-Certificate -Cert $signature.SignerCertificate -FilePath $env:CERT_PATH -Force | Out-Null" || exit /b 1

copy /y "install_msix.bat" "%OUTPUT_DIR%\install_msix.bat" >nul || exit /b 1

echo.
echo ==^> Windows package complete:
echo     %MSIX_PATH%
echo     %CERT_PATH%
echo     %OUTPUT_DIR%\install_msix.bat
echo.
echo Copy the full Release directory to the destination computer and run install_msix.bat.

