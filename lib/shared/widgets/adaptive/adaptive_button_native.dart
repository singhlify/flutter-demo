import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:macos_ui/macos_ui.dart' as macos;

import '../../utils/platform.dart';

/// Platform-adaptive button: Fluent (Windows), Macos (macOS), Material (Linux).
class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String? label;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final child = _buildChild(context);
    if (tooltip != null) {
      if (isWindows) {
        return fluent.Tooltip(message: tooltip!, child: child);
      }
      return Tooltip(message: tooltip!, child: child);
    }
    return child;
  }

  Widget _buildChild(BuildContext context) {
    if (isWindows) {
      return fluent.IconButton(
        icon: icon,
        onPressed: onPressed,
      );
    }
    if (isMacOS) {
      return macos.PushButton(
        controlSize: macos.ControlSize.small,
        child: icon,
        onPressed: onPressed,
      );
    }
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}
