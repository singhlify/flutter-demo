#!/bin/bash
# Run from word_ribbon_poc/ directory to add platform support and install dependencies.
set -e
cd "$(dirname "$0")/.."
flutter create . --platforms=windows,macos,linux,web --org=com.example
flutter pub get
echo "Setup complete. Run: flutter run -d windows (or macos, linux, chrome)"
