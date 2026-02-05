# Word Ribbon UI PoC

A cross-platform Flutter Proof-of-Concept that mimics a Word-style ribbon UI with platform-adaptive shells. Used to evaluate Flutter for enterprise-grade document editing across Windows, macOS, Linux, and Web.

## Prerequisites

- Flutter 3.16+ (stable channel)
- Enable desktop platforms: `flutter config --enable-windows-desktop`, `flutter config --enable-macos-desktop`, etc.

## Setup

From the project root (`word_ribbon_poc/`):

```bash
# 1. Add platform support (creates windows/, macos/, linux/, web/ folders)
flutter create . --platforms=windows,macos,linux,web

# 2. Install dependencies
flutter pub get
```

If you get "Project already exists" when running `flutter create`, the platforms may already be configured. Run `flutter pub get` and proceed to running the app.

## Running the App

```bash
# Windows (primary)
flutter run -d windows

# macOS (primary)
flutter run -d macos

# Linux (secondary)
flutter run -d linux

# Web (secondary)
flutter run -d chrome
```

## Package Rationale

| Package    | Purpose                                      |
| ---------- | -------------------------------------------- |
| fluent_ui  | Windows-native Fluent Design widgets         |
| macos_ui   | macOS-native Cocoa/AppKit-style widgets      |
| flutter_quill | WYSIWYG rich text editor, cross-platform  |
| go_router  | Routing (single route; structure for future) |
| provider   | Simple state management                      |

## Known Limitations

- **Web**: Rich text paste from clipboard is not supported (flutter_quill limitation)
- Many ribbon controls are stubs (Paste, Cut, Copy, Picture, Table, Link, Margins, etc.)
- Styles (Normal, H1, H2) are stubs
- Zoom and Ruler in View tab are stubs

## Working Features

- Bold, Italic, Underline formatting
- Font size dropdown
- Alignment (left, center, right, justify)
- Bullets
- Undo/Redo (buttons and Ctrl/Cmd+Z, Ctrl/Cmd+Y)
- Word count (real)
- Keyboard shortcuts: Ctrl/Cmd+B, Ctrl/Cmd+I, Ctrl/Cmd+U for formatting

## Demo Script

1. Open the app on Windows or macOS
2. Type a sample paragraph in the editor
3. Select text and apply **Bold**, **Italic**, **Underline** via the Home tab
4. Change alignment (Align Left, Center, Right, Justify)
5. Add bullets to a paragraph
6. Use Undo/Redo via the Quick Access Toolbar or Ctrl+Z / Ctrl+Y
7. Switch ribbon tabs (Home, Insert, Layout, Review, View)
