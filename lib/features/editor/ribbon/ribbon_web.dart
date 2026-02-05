import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../shared/word_icons.dart';
import '../../../state/ribbon_state.dart';
import 'tabs/home_tab.dart';
import 'tabs/insert_tab.dart';
import 'tabs/draw_tab.dart';
import 'tabs/layout_tab.dart';
import 'tabs/references_tab.dart';
import 'tabs/mailings_tab.dart';
import 'tabs/review_tab.dart';
import 'tabs/view_tab.dart';

/// Word-style ribbon with tab bar (File, Home, Insert, Draw, Layout, References, Mailings, Review, View, Help)
/// and content panel that shows ribbon groups per tab.
class Ribbon extends StatelessWidget {
  const Ribbon({super.key});

  static const _tabs = [
    ('file', 'File'),
    ('home', 'Home'),
    ('insert', 'Insert'),
    ('draw', 'Draw'),
    ('layout', 'Layout'),
    ('references', 'References'),
    ('mailings', 'Mailings'),
    ('review', 'Review'),
    ('view', 'View'),
    ('help', 'Help'),
  ];

  @override
  Widget build(BuildContext context) {
    final ribbon = context.watch<RibbonState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tab bar row + right side buttons (Comments, Editing, Share)
        _buildTabBarRow(context, ribbon),
        // Ribbon content panel
        if (ribbon.selectedTabId != 'file')
          Container(
            height: 94,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              border: Border(
                bottom: BorderSide(color: const Color(0xFFD6D6D6), width: 1),
              ),
            ),
            child: _buildContent(ribbon.selectedTabId),
          ),
      ],
    );
  }

  Widget _buildTabBarRow(BuildContext context, RibbonState ribbon) {
    return Container(
      height: 36,
      color: const Color(0xFFF3F3F3),
      child: Row(
        children: [
          // Tab buttons
          ..._tabs.map((t) {
            final selected = t.$1 == ribbon.selectedTabId;
            final isFile = t.$1 == 'file';
            return _TabButton(
              label: t.$2,
              selected: selected,
              isFile: isFile,
              onTap: () {
                if (!isFile) {
                  ribbon.selectedTabId = t.$1;
                }
              },
            );
          }),
          const Spacer(),
          // Right side: Comments, Editing, Share
          _RightSideButton(
            icon: WordIcons.comment,
            label: 'Comments',
            onTap: () {},
          ),
          const SizedBox(width: 4),
          _EditingDropdown(),
          const SizedBox(width: 4),
          _ShareButton(),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildContent(String tabId) {
    return switch (tabId) {
      'home' => const HomeTab(),
      'insert' => const InsertTab(),
      'draw' => const DrawTab(),
      'layout' => const LayoutTab(),
      'references' => const ReferencesTab(),
      'mailings' => const MailingsTab(),
      'review' => const ReviewTab(),
      'view' => const ViewTab(),
      _ => const HomeTab(),
    };
  }
}

/// Individual tab button in the ribbon tab bar
class _TabButton extends StatefulWidget {
  const _TabButton({
    required this.label,
    required this.selected,
    required this.isFile,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool isFile;
  final VoidCallback onTap;

  @override
  State<_TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<_TabButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: widget.selected
                ? Colors.white
                : (_hovering ? const Color(0xFFE8E8E8) : Colors.transparent),
            border: widget.selected
                ? Border(
                    left: BorderSide(color: const Color(0xFFD6D6D6), width: 1),
                    right: BorderSide(color: const Color(0xFFD6D6D6), width: 1),
                    top: BorderSide(color: const Color(0xFF2B579A), width: 2),
                  )
                : null,
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w400,
                color: widget.isFile
                    ? const Color(0xFF2B579A)
                    : (widget.selected
                        ? const Color(0xFF2B579A)
                        : const Color(0xFF444444)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Comments button on the right side of the tab bar
class _RightSideButton extends StatelessWidget {
  const _RightSideButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF444444)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFF444444)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Editing dropdown button
class _EditingDropdown extends StatelessWidget {
  const _EditingDropdown();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD6D6D6)),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(WordIcons.editing, size: 14, color: const Color(0xFF2B579A)),
            const SizedBox(width: 4),
            const Text(
              'Editing',
              style: TextStyle(fontSize: 12, color: Color(0xFF444444)),
            ),
            const SizedBox(width: 4),
            Icon(WordIcons.chevronDown, size: 10, color: const Color(0xFF444444)),
          ],
        ),
      ),
    );
  }
}

/// Share button styled like Word's blue share button
class _ShareButton extends StatelessWidget {
  const _ShareButton();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF2B579A),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(WordIcons.share, size: 14, color: Colors.white),
            const SizedBox(width: 4),
            const Text(
              'Share',
              style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            Icon(WordIcons.chevronDown, size: 10, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
