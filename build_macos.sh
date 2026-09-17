#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

REQUIRED_FLUTTER="$(cat .flutter-version)"

if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: flutter not found on PATH. See BUILD_MACOS.md" >&2
  exit 1
fi

FLUTTER_VERSION="$(flutter --version 2>/dev/null | awk '/^Flutter /{print $2}')"
if [ "$FLUTTER_VERSION" != "$REQUIRED_FLUTTER" ]; then
  echo "WARNING: this repo is pinned to Flutter $REQUIRED_FLUTTER but found $FLUTTER_VERSION on PATH." >&2
  echo "         Newer Flutter breaks dependencies; see BUILD_MACOS.md for how to install $REQUIRED_FLUTTER with brew." >&2
fi

if [ ! -f lib/.env.dart ]; then
  echo "==> Creating lib/.env.dart from lib/.env.dart.example"
  cp lib/.env.dart.example lib/.env.dart
fi

echo "==> Generating built_value code (dart run build_runner build)"
dart run build_runner build --delete-conflicting-outputs

echo "==> Building universal macOS app (release, ad-hoc signed)"
FLUTTER_XCODE_CODE_SIGN_STYLE=Manual \
FLUTTER_XCODE_CODE_SIGN_IDENTITY=- \
FLUTTER_XCODE_DEVELOPMENT_TEAM= \
FLUTTER_XCODE_CODE_SIGN_ENTITLEMENTS="$PWD/macos/Runner/Local.entitlements" \
  flutter build macos --release

APP="build/macos/Build/Products/Release/Invoice Ninja.app"
codesign --force --deep --sign - "$APP"
codesign --verify --deep --strict "$APP"
echo "==> Built: $APP"
lipo -info "$APP/Contents/MacOS/Invoice Ninja"
