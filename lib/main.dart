import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/platform/window_setup.dart';
import 'shared/utils/logging.dart';

void main() async {
  log('main: starting application');
  await windowSetup();
  runApp(const App());
  log('main: runApp called');
}
