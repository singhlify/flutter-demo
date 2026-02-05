import 'package:flutter/widgets.dart';

import 'platform/windows_shell.dart';

/// Single FluentApp entry - used everywhere (web, Windows, macOS, Linux).
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const WindowsShell();
  }
}
