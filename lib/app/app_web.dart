import 'package:flutter/material.dart';

import 'platform/default_shell.dart';
import '../shared/utils/logging.dart';

/// App entry for web - Material only.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    log('App (web): building DefaultShell');
    return const DefaultShell();
  }
}
