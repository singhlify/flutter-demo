import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:macos_ui/macos_ui.dart' as macos;

import '../../utils/platform.dart';

/// Platform-adaptive dropdown: Fluent (Windows), Macos (macOS), Material (Linux).
class AdaptiveDropdown<T> extends StatelessWidget {
  const AdaptiveDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width = 80,
  });

  final T value;
  final List<({T value, String label})> items;
  final ValueChanged<T?> onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (isWindows) {
      return SizedBox(
        width: width,
        child: fluent.ComboBox<T>(
          value: value,
          items: items.map((i) => fluent.ComboBoxItem<T>(value: i.value, child: Text(i.label))).toList(),
          onChanged: onChanged,
        ),
      );
    }
    if (isMacOS) {
      return SizedBox(
        width: width,
        child: macos.MacosPopupButton<T>(
          value: value,
          items: items.map((i) => macos.MacosPopupMenuItem(value: i.value, child: Text(i.label))).toList(),
          onChanged: onChanged,
        ),
      );
    }
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<T>(
        value: value,
        items: items.map((i) => DropdownMenuItem<T>(value: i.value, child: Text(i.label))).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          isDense: true,
        ),
      ),
    );
  }
}
