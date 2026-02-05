import 'package:flutter/material.dart';

/// Material-only dropdown for web (no fluent_ui/macos_ui).
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
