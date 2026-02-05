import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../app/theme/tokens.dart';
import '../features/editor/document/document_controller.dart';
import '../state/zoom_state.dart';

/// Status bar: Page, Words, language, zoom slider, zoom %.
class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    final zoomState = context.watch<ZoomState>();
    final theme = FluentTheme.maybeOf(context);
    final bgColor = theme?.resources.solidBackgroundFillColorSecondary ??
        const Color(0xFFE0E0E0);
    final borderColor = theme?.resources.surfaceStrokeColorDefault ??
        const Color(0xFFBDBDBD);

    return Container(
      height: Tokens.statusBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),
      child: Row(
        children: [
          const Text('Page 1'),
          const SizedBox(width: 16),
          Text('Words: ${doc.wordCount}'),
          const SizedBox(width: 24),
          Text('English (Canada)', style: TextStyle(fontSize: 11, color: theme?.resources.textFillColorSecondary ?? const Color(0xFF6B6B6B))),
          const Spacer(),
          SizedBox(
            width: Tokens.statusBarZoomSliderWidth,
            child: Slider(
              value: zoomState.zoom,
              min: 0.5,
              max: 2.0,
              onChanged: (v) => zoomState.zoom = v,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(width: 36, child: Text('${zoomState.zoomPercent}%')),
        ],
      ),
    );
  }
}
