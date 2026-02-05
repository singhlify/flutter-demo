import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../shared/word_icons.dart';
import 'quick_access_toolbar.dart';

/// MS Word-style title bar with AutoSave, QAT, document title, search, and window controls.
class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      color: const Color(0xFF2B579A), // Word blue title bar
      child: Row(
        children: [
          const SizedBox(width: 6),
          // Word icon
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
              child: Text(
                'W',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2B579A),
                  height: 1.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // AutoSave toggle
          const _AutoSaveToggle(),
          const SizedBox(width: 8),
          // Quick Access Toolbar (Save, Undo, Redo)
          const QuickAccessToolbar(),
          const SizedBox(width: 6),
          // Customize QAT dropdown
          _titleBarIconButton(WordIcons.chevronDown, 10),
          const SizedBox(width: 8),
          // Spacer before title - push title to center area
          const Spacer(),
          // Document title
          const Text(
            'Document1',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            '  -  Word',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          // Search box
          const _SearchBox(),
          const SizedBox(width: 12),
          // User avatar
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7B83EB),
            ),
            child: const Center(
              child: Text('J', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(width: 8),
          // Window controls
          _windowControlButton(WordIcons.minimize, false),
          _windowControlButton(WordIcons.maximize, false),
          _windowControlButton(WordIcons.close, true),
        ],
      ),
    );
  }

  static Widget _titleBarIconButton(IconData icon, double size) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Center(
        child: Icon(icon, size: size, color: Colors.white.withValues(alpha: 0.8)),
      ),
    );
  }

  static Widget _windowControlButton(IconData icon, bool isClose) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 46,
          height: 32,
          color: isClose ? Colors.transparent : Colors.transparent,
          child: Center(
            child: Icon(icon, size: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// AutoSave toggle matching Word's style
class _AutoSaveToggle extends StatefulWidget {
  const _AutoSaveToggle();

  @override
  State<_AutoSaveToggle> createState() => _AutoSaveToggleState();
}

class _AutoSaveToggleState extends State<_AutoSaveToggle> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'AutoSave',
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => setState(() => _isOn = !_isOn),
          child: Container(
            width: 32,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: _isOn ? const Color(0xFF4CAF50) : Colors.white.withValues(alpha: 0.3),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 150),
              alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Search box in the title bar
class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(WordIcons.search, size: 14, color: Colors.white.withValues(alpha: 0.7)),
          const SizedBox(width: 6),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
