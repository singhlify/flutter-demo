import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../shared/word_icons.dart';
import '../features/editor/document/document_controller.dart';

/// Compact quick access toolbar icons for the title bar (Save, Undo, Redo).
class QuickAccessToolbar extends StatelessWidget {
  const QuickAccessToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QATButton(icon: WordIcons.save, tooltip: 'Save', onPressed: () {}),
        _QATButton(
          icon: WordIcons.undo,
          tooltip: 'Undo',
          onPressed: doc.hasUndo ? doc.undo : null,
        ),
        _QATButton(
          icon: WordIcons.redo,
          tooltip: 'Redo',
          onPressed: doc.hasRedo ? doc.redo : null,
        ),
      ],
    );
  }
}

class _QATButton extends StatelessWidget {
  const _QATButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Center(
            child: Icon(
              icon,
              size: 14,
              color: isEnabled
                  ? Colors.white.withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.35),
            ),
          ),
        ),
      ),
    );
  }
}
