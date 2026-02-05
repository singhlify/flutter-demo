/// Platform-adaptive button. Uses Material on web, Fluent/Macos on native.
export 'adaptive_button_web.dart' if (dart.library.io) 'adaptive_button_native.dart';
