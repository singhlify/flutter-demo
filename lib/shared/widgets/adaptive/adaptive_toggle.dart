/// Platform-adaptive toggle. Uses Material on web, Fluent/Macos on native.
export 'adaptive_toggle_web.dart' if (dart.library.io) 'adaptive_toggle_native.dart';
