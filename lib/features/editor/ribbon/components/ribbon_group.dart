import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../app/theme/tokens.dart';

/// A ribbon group with heading and controls.
class RibbonGroup extends StatelessWidget {
  const RibbonGroup({
    super.key,
    required this.label,
    required this.children,
    this.showTrailingDivider = false,
  });

  final String label;
  final List<Widget> children;
  final bool showTrailingDivider;

  @override
  Widget build(BuildContext context) {
    final fluentTheme = FluentTheme.maybeOf(context);
    final labelColor = fluentTheme != null
        ? fluentTheme.resources.textFillColorSecondary
        : const Color(0xFF6B6B6B);
    final dividerColor = fluentTheme?.resources.surfaceStrokeColorDefault ?? const Color(0xFFE0E0E0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Tokens.spacing12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: labelColor,
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
        ),
        if (showTrailingDivider)
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: dividerColor,
            height: 48,
          ),
      ],
    );
  }
}
