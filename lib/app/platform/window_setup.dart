/// Window setup - no-op on web, initializes window_manager on desktop.
export 'window_setup_stub.dart' if (dart.library.io) 'window_setup_io.dart';
