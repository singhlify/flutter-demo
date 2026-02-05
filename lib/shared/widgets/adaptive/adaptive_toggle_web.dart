import 'package:flutter/material.dart';

/// Material-only toggle for web (no fluent_ui/macos_ui).
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
