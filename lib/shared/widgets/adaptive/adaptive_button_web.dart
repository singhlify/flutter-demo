import 'package:flutter/material.dart';

/// Material-only button for web (no fluent_ui/macos_ui).
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
    final button = IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
    );
    if (tooltip != null && tooltip!.isNotEmpty) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}
