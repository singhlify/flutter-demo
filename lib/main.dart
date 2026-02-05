import 'package:flutter/material.dart';

import 'app/app.dart';
import 'shared/utils/logging.dart';

void main() {
  log('main: starting application');
  runApp(const App());
  log('main: runApp called');
}
