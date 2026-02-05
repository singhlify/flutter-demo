import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';

/// A ribbon group with heading and controls.
class RibbonGroup extends StatelessWidget {
  const RibbonGroup({
    super.key,
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Tokens.spacing12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: Tokens.spacing4),
          Wrap(
            spacing: Tokens.spacing4,
            runSpacing: Tokens.spacing4,
            children: children,
          ),
        ],
      ),
    );
  }
}
