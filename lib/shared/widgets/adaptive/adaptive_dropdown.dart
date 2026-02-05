/// Platform-adaptive dropdown. Uses Material on web, Fluent/Macos on native.
export 'adaptive_dropdown_web.dart' if (dart.library.io) 'adaptive_dropdown_native.dart';
