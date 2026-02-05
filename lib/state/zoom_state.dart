import 'package:flutter/foundation.dart';

/// Zoom level for the page canvas (50–200%).
class ZoomState extends ChangeNotifier {
  double _zoom = 1.0;

  double get zoom => _zoom;

  /// Zoom as percentage (50–200).
  int get zoomPercent => (_zoom * 100).round();

  set zoom(double value) {
    final clamped = value.clamp(0.5, 2.0);
    if (_zoom != clamped) {
      _zoom = clamped;
      notifyListeners();
    }
  }

  set zoomPercent(int value) {
    zoom = (value.clamp(50, 200) / 100.0);
  }
}
