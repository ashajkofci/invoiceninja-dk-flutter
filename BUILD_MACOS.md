# Building the macOS app locally (universal)

`./build_macos.sh` produces a universal (arm64 + x86_64) release build at:

```
build/macos/Build/Products/Release/Invoice Ninja.app
```

## Requirements

- **Flutter 3.41.9** — the version pinned in `.flutter-version` (also used by CI and codemagic).
  Newer stable Flutter (e.g. 3.47.x) breaks the dependency set:
  - `source_gen` 3.1.0 no longer compiles against `analyzer` ≥ 8.4.1 (`getInvocation` removed)
  - `material_design_icons_flutter` extends `IconData`, which is `final` in newer Flutter
  - the pinned `super_editor` git ref is missing `TextInputConnection.updateStyle`
- ~5 GB free disk space and Xcode with the macOS toolchain.

## Installing the pinned Flutter with brew

Homebrew's `flutter` cask only ships the latest version, so 3.41.9 is installed from the
cask file at the homebrew-cask commit that published it (`e0fc5be8eb66`):

```sh
brew tap-new adrian/local-casks   # done once on this machine; skip if the tap exists
mkdir -p "$(brew --repository)/Library/Taps/adrian/homebrew-local-casks/Casks"
curl -s https://raw.githubusercontent.com/Homebrew/homebrew-cask/e0fc5be8eb66/Casks/f/flutter.rb \
  -o "$(brew --repository)/Library/Taps/adrian/homebrew-local-casks/Casks/flutter.rb"
brew uninstall --cask flutter     # removes the newer version
brew install --cask adrian/local-casks/flutter
flutter --version                 # should print 3.41.9
```

## What the build needs (and why)

1. **`lib/.env.dart`** — gitignored config file required to compile. The script copies it
   from `lib/.env.dart.example` if it does not exist.
2. **`analyzer: 8.3.0` override in `pubspec.yaml`** — the committed dependency set resolves
   `analyzer` 8.4.1, which breaks `source_gen` 3.1.0 (required by `built_value_generator`
   8.11.1). The override pins a compatible analyzer.
3. **`dart run build_runner build --delete-conflicting-outputs`** — the generated
   `*.g.dart` files in the repo are stale for `InvoiceItemEntity`/`ProductEntity`
   (missing `group*` fields); codegen must run before compiling.
4. **Ad-hoc code signing** — no Apple Development certificates or provisioning profiles
   for `com.invoiceninja.app` exist on this machine, so the build overrides the Xcode
   signing settings via `FLUTTER_XCODE_*` environment variables (passed through by the
   Flutter tool as xcodebuild settings):
   - `CODE_SIGN_STYLE=Manual`
   - `CODE_SIGN_IDENTITY=-` (ad-hoc)
   - `DEVELOPMENT_TEAM=` (empty)
   - `CODE_SIGN_ENTITLEMENTS=macos/Runner/Local.entitlements`
5. **`macos/Runner/Local.entitlements`** — same as `Release.entitlements` minus
   `com.apple.developer.applesignin` (Sign In with Apple), which is a restricted
   entitlement that requires a provisioning profile. The resulting app runs fine locally
   (App Sandbox enabled) but Sign In with Apple will not work.

## Universal build

`flutter build macos --release` on this Flutter version defaults to a fat binary with
both `arm64` and `x86_64` (do not enable `flutter config --enable-macos-arm64-only`).
The script verifies the result with `lipo -info`.

## App Store / distribution builds

Do **not** use this script for signed distribution builds. Build with the original
`Release.entitlements`, the real `DEVELOPMENT_TEAM` (`NPC44Y2C98`), automatic signing
and a valid provisioning profile instead (as CI does).

## Known warnings (harmless)

- `MACOSX_DEPLOYMENT_TARGET is set to 10.12` warnings from some pods
- "Run script build phase 'Run Script' will be run during every build" warning
- "plugins do not support Swift Package Manager" notice
