import 'package:flutter/foundation.dart' show kIsWeb;

export 'platform_stub.dart'
    if (dart.library.io) 'platform_io.dart';

bool get isWeb => kIsWeb;
