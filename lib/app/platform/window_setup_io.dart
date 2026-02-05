import 'dart:ui' show Size;
import 'package:window_manager/window_manager.dart';

/// Initialize window_manager on desktop (Windows, macOS, Linux).
Future<void> windowSetup() async {
  await WindowManager.instance.ensureInitialized();
  const options = WindowOptions(
    title: 'Word Ribbon PoC',
    minimumSize: Size(800, 600),
  );
  await WindowManager.instance.waitUntilReadyToShow(options, () async {
    await WindowManager.instance.show();
    await WindowManager.instance.focus();
  });
}
