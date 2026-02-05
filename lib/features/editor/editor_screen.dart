// EditorScreen is no longer used as a wrapper.
// The ribbon and page canvas are composed directly in WordShell.
// This file is kept for backwards compatibility but is not imported anywhere.
import 'package:flutter/widgets.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
