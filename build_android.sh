#!/bin/bash
#
# Build the Android APK from WSL2, installing the required toolchain
# (Temurin JDK 17, Flutter SDK, Android cmdline-tools + SDK packages)
# into ~/dev on first run. No sudo required.
#
# Usage: ./build_android.sh          (release APK)
#        ./build_android.sh --debug  (debug APK)

set -e

# --- Toolchain versions -----------------------------------------------------
FLUTTER_VERSION=$(cat .flutter-version 2>/dev/null || echo "3.41.9")
JDK_VERSION=17
ANDROID_API=36
BUILD_TOOLS="36.0.0"
NDK_VERSION="28.2.13676358"
CMDTOOLS_ZIP="commandlinetools-linux-11076708_latest.zip"

# --- Locations --------------------------------------------------------------
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
export JAVA_HOME="$HOME/dev/jdk"
export ANDROID_HOME="$HOME/dev/android-sdk"
export PATH="$HOME/dev/flutter/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

mkdir -p "$HOME/dev/downloads"
cd "$HOME/dev/downloads"

# --- Temurin JDK ------------------------------------------------------------
if [ ! -x "$JAVA_HOME/bin/java" ]; then
    echo "==> Installing Temurin JDK $JDK_VERSION to $JAVA_HOME"
    mkdir -p "$HOME/dev/jdk"
    curl -L -o jdk.tar.gz "https://api.adoptium.net/v3/binary/latest/$JDK_VERSION/ga/linux/x64/jdk/hotspot/normal/eclipse"
    tar -xzf jdk.tar.gz -C "$HOME/dev/jdk" --strip-components=1
fi

# --- Flutter SDK ------------------------------------------------------------
if [ ! -x "$HOME/dev/flutter/bin/flutter" ]; then
    echo "==> Installing Flutter $FLUTTER_VERSION to $HOME/dev/flutter"
    curl -L -o flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
    tar -xJf flutter.tar.xz -C "$HOME/dev"
fi

# --- Android cmdline-tools --------------------------------------------------
if [ ! -x "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" ]; then
    echo "==> Installing Android cmdline-tools to $ANDROID_HOME"
    mkdir -p "$ANDROID_HOME/cmdline-tools"
    curl -L -o cmdtools.zip "https://dl.google.com/android/repository/$CMDTOOLS_ZIP"
    unzip -q cmdtools.zip -d "$ANDROID_HOME/cmdline-tools"
    mv "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
fi

# --- Android SDK packages ---------------------------------------------------
if [ ! -d "$ANDROID_HOME/platforms/android-$ANDROID_API" ] || [ ! -d "$ANDROID_HOME/ndk/$NDK_VERSION" ]; then
    echo "==> Installing Android SDK packages"
    yes | sdkmanager --licenses > /dev/null
    yes | sdkmanager --install \
        "platform-tools" \
        "platforms;android-$ANDROID_API" \
        "build-tools;$BUILD_TOOLS" \
        "ndk;$NDK_VERSION" \
        "cmake;3.22.1"
fi

# --- Flutter config ---------------------------------------------------------
flutter config --android-sdk "$ANDROID_HOME" > /dev/null

# --- Project setup ----------------------------------------------------------
cd "$SCRIPT_DIR"

if [ ! -f lib/.env.dart ]; then
    cp lib/.env.dart.example lib/.env.dart
fi

if [ ! -f android/app/build.gradle.kts ]; then
    cp android/app/build.gradle.dev.kts android/app/build.gradle.kts
fi

# Without android/key.properties the release signing config does not exist,
# so fall back to debug signing instead of failing the build.
if [ ! -f android/key.properties ]; then
    perl -0pi -e 's/signingConfig = signingConfigs\.getByName\("debug"\)\n(\s*)signingConfig = signingConfigs\.getByName\("release"\)/signingConfig = keystorePropertiesFile.exists() ? signingConfigs.getByName("release") : signingConfigs.getByName("debug")/' \
        android/app/build.gradle.kts
fi

rm -f android/local.properties

flutter pub get

# --- Build ------------------------------------------------------------------
if [ "$1" = "--debug" ]; then
    flutter build apk --debug
else
    flutter build apk
fi

echo ""
echo "APK output:"
ls -lh build/app/outputs/flutter-apk/*.apk
