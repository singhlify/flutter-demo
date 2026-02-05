import 'package:flutter/material.dart';

import 'platform/default_shell.dart';
import 'platform/macos_shell.dart';
import 'platform/windows_shell.dart';
import '../shared/utils/platform.dart';

/// App entry for native - Windows/macOS/Linux.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (isWindows) {
      return const WindowsShell();
    }
    if (isMacOS) {
      return const MacosShell();
    }
    return const DefaultShell();
  }
}
