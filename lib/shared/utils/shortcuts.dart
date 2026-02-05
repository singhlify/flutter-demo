import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'platform.dart';

/// Modifier key for shortcuts: Control on Windows/Linux, Meta (Cmd) on macOS.
bool get useMetaKey => isMacOS;

ShortcutActivator get boldShortcut => useMetaKey
    ? const SingleActivator(LogicalKeyboardKey.keyB, meta: true)
    : const SingleActivator(LogicalKeyboardKey.keyB, control: true);

ShortcutActivator get italicShortcut => useMetaKey
    ? const SingleActivator(LogicalKeyboardKey.keyI, meta: true)
    : const SingleActivator(LogicalKeyboardKey.keyI, control: true);

ShortcutActivator get underlineShortcut => useMetaKey
    ? const SingleActivator(LogicalKeyboardKey.keyU, meta: true)
    : const SingleActivator(LogicalKeyboardKey.keyU, control: true);

ShortcutActivator get undoShortcut => useMetaKey
    ? const SingleActivator(LogicalKeyboardKey.keyZ, meta: true)
    : const SingleActivator(LogicalKeyboardKey.keyZ, control: true);

ShortcutActivator get redoShortcut => useMetaKey
    ? const SingleActivator(LogicalKeyboardKey.keyZ, meta: true, shift: true)
    : const SingleActivator(LogicalKeyboardKey.keyY, control: true);

/// Intents for document formatting.
class BoldIntent extends Intent {
  const BoldIntent();
}

class ItalicIntent extends Intent {
  const ItalicIntent();
}

class UnderlineIntent extends Intent {
  const UnderlineIntent();
}

class UndoIntent extends Intent {
  const UndoIntent();
}

class RedoIntent extends Intent {
  const RedoIntent();
}
