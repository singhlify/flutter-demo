import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../features/editor/document/document_controller.dart';
import '../shared/word_icons.dart';
import '../state/zoom_state.dart';

/// MS Word-style status bar: Page info | Words | Language | Text Predictions | Accessibility | [spacer] | Focus | View modes | Zoom slider | Zoom %
class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    final zoomState = context.watch<ZoomState>();

    return Container(
      height: 24,
      decoration: const BoxDecoration(
        color: Color(0xFFF3F3F3),
        border: Border(
          top: BorderSide(color: Color(0xFFD6D6D6), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          // Page info
          _StatusBarText('Page 1 of 1'),
          _statusBarDivider(),
          // Word count
          _StatusBarText('${doc.wordCount} words'),
          _statusBarDivider(),
          // Language
          _StatusBarText('English (Canada)'),
          _statusBarDivider(),
          // Text Predictions
          _StatusBarText('Text Predictions: On'),
          _statusBarDivider(),
          // Accessibility
          _StatusBarText('Accessibility: Good to go'),
          const Spacer(),
          // Focus mode icon
          _StatusBarIconButton(icon: WordIcons.focusMode, tooltip: 'Focus', onTap: () {}),
          const SizedBox(width: 8),
          // View mode icons
          _StatusBarIconButton(icon: WordIcons.readingView, tooltip: 'Read Mode', onTap: () {}),
          const SizedBox(width: 2),
          _StatusBarIconButton(icon: WordIcons.printLayoutView, tooltip: 'Print Layout', onTap: () {}, isActive: true),
          const SizedBox(width: 2),
          _StatusBarIconButton(icon: WordIcons.webLayoutView, tooltip: 'Web Layout', onTap: () {}),
          const SizedBox(width: 12),
          // Zoom slider
          const Icon(FluentIcons.subtract_12_regular, size: 12, color: Color(0xFF888888)),
          const SizedBox(width: 4),
          SizedBox(
            width: 100,
            child: SliderTheme(
              data: const SliderThemeData(),
              child: _ZoomSlider(zoomState: zoomState),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(FluentIcons.add_12_regular, size: 12, color: Color(0xFF888888)),
          const SizedBox(width: 8),
          // Zoom percentage
          _StatusBarText('${zoomState.zoomPercent}%'),
        ],
      ),
    );
  }

  static Widget _statusBarDivider() {
    return Container(
      width: 1,
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0xFFD6D6D6),
    );
  }
}

class _StatusBarText extends StatelessWidget {
  const _StatusBarText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: Color(0xFF666666),
      ),
    );
  }
}

class _StatusBarIconButton extends StatefulWidget {
  const _StatusBarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.isActive = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool isActive;

  @override
  State<_StatusBarIconButton> createState() => _StatusBarIconButtonState();
}

class _StatusBarIconButtonState extends State<_StatusBarIconButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: _hovering ? const Color(0xFFE0E0E0) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Icon(
                widget.icon,
                size: 14,
                color: widget.isActive
                    ? const Color(0xFF2B579A)
                    : const Color(0xFF888888),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom zoom slider widget
class _ZoomSlider extends StatelessWidget {
  const _ZoomSlider({required this.zoomState});

  final ZoomState zoomState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Slider(
        value: zoomState.zoom,
        min: 0.5,
        max: 2.0,
        onChanged: (v) => zoomState.zoom = v,
      ),
    );
  }
}

/// Custom SliderThemeData for a minimal Word-like slider appearance
class SliderThemeData {
  const SliderThemeData();
}

class SliderTheme extends InheritedWidget {
  const SliderTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final SliderThemeData data;

  @override
  bool updateShouldNotify(SliderTheme oldWidget) => false;
}
