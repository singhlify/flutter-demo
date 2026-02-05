import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:macos_ui/macos_ui.dart' as macos;

import '../../utils/platform.dart';

/// Platform-adaptive toggle: Fluent (Windows), Macos (macOS), Material (Linux).
class AdaptiveToggle extends StatelessWidget {
  const AdaptiveToggle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.icon,
    this.tooltip,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget icon;
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
      return fluent.ToggleButton(
        checked: value,
        onChanged: onChanged,
        child: icon,
      );
    }
    if (isMacOS) {
      return macos.PushButton(
        controlSize: macos.ControlSize.small,
        child: icon,
        onPressed: () => onChanged(!value),
      );
    }
    return IconButton(
      icon: icon,
      onPressed: () => onChanged(!value),
      style: IconButton.styleFrom(
        backgroundColor: value ? Theme.of(context).colorScheme.primaryContainer : null,
      ),
      tooltip: tooltip,
    );
  }
}
