/// App entry. Uses Material-only on web, platform shells on native.
export 'app_web.dart' if (dart.library.io) 'app_native.dart';
