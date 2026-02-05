import 'package:flutter/foundation.dart';

/// Simple logging utility. In debug, prints to console.
void log(String message, [Object? error, StackTrace? stackTrace]) {
  if (kDebugMode) {
    debugPrint('[WordRibbon] $message');
    if (error != null) {
      debugPrint('  Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('  $stackTrace');
    }
  }
}
