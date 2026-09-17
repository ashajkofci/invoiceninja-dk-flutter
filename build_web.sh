#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

BACKEND_DIR="${1:-../invoiceninja}"
PUBLIC_DIR="$BACKEND_DIR/public"
FOSS_FILES=(
  lib/utils/oauth.dart
  lib/ui/app/upgrade_dialog.dart
  lib/ui/app/pinput.dart
  pubspec.yaml
)

command -v flutter >/dev/null || { echo "ERROR: flutter not found on PATH" >&2; exit 1; }
[ -d "$PUBLIC_DIR" ] || { echo "ERROR: backend public directory not found: $PUBLIC_DIR" >&2; exit 1; }
[ -f lib/.env.dart ] || cp lib/.env.dart.example lib/.env.dart

echo "==> Building Flutter web"
rm -rf .dart_tool/flutter_build build/web
flutter build web --release --source-maps
rsync -a --exclude index.html build/web/ "$PUBLIC_DIR/"

BACKUP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/invoiceninja-foss.XXXXXX")"
HAD_LOCK=0
restore_sources() {
  for file in "${FOSS_FILES[@]}"; do
    cp "$BACKUP_DIR/$file" "$file"
  done
  if [ -f "$BACKUP_DIR/pubspec.lock" ]; then
    cp "$BACKUP_DIR/pubspec.lock" pubspec.lock
  elif [ "$HAD_LOCK" -eq 0 ]; then
    rm -f pubspec.lock
  fi
}
cleanup() {
  restore_sources
  flutter pub get >/dev/null 2>&1 || true
  rm -rf "$BACKUP_DIR"
}

for file in "${FOSS_FILES[@]}"; do
  mkdir -p "$BACKUP_DIR/$(dirname "$file")"
  cp "$file" "$BACKUP_DIR/$file"
done
if [ -f pubspec.lock ]; then
  HAD_LOCK=1
  cp pubspec.lock "$BACKUP_DIR/pubspec.lock"
fi
trap cleanup EXIT

echo "==> Building Flutter web FOSS"
cp lib/utils/oauth.dart.foss lib/utils/oauth.dart
cp lib/ui/app/upgrade_dialog.dart.foss lib/ui/app/upgrade_dialog.dart
cp lib/ui/app/pinput.dart.foss lib/ui/app/pinput.dart
cp pubspec.foss.yaml pubspec.yaml
rm -rf .dart_tool/flutter_build build/web
flutter pub get
flutter build web --release --source-maps
cp build/web/main.dart.js "$PUBLIC_DIR/main.foss.dart.js"
cp build/web/main.dart.js.map "$PUBLIC_DIR/main.foss.dart.js.map"

echo "==> Copied Flutter web and FOSS builds to $PUBLIC_DIR"
