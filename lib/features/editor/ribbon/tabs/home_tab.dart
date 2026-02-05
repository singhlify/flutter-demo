import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/utils/logging.dart';
import '../../document/commands.dart';
import '../../document/document_controller.dart';
import '../ribbon_state.dart';
import '../components/ribbon_group.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_dropdown.dart';
import '../../../../shared/widgets/adaptive/adaptive_toggle.dart';

/// Home tab: Clipboard, Font, Paragraph, Styles.
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static const _fontSizes = [8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72];

  @override
  Widget build(BuildContext context) {
    log('HomeTab: building, watching DocumentController and RibbonState');
    final doc = context.watch<DocumentController>();
    final ribbon = context.watch<RibbonState>();
    log('HomeTab: ribbon.isBold=${ribbon.isBold} fontSize=${ribbon.fontSize}');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'Clipboard',
            children: [
              AdaptiveButton(icon: Icon(Icons.content_paste), onPressed: () {}, tooltip: 'Paste'),
              AdaptiveButton(icon: Icon(Icons.content_cut), onPressed: () {}, tooltip: 'Cut'),
              AdaptiveButton(icon: Icon(Icons.content_copy), onPressed: () {}, tooltip: 'Copy'),
            ],
          ),
          RibbonGroup(
            label: 'Font',
            children: [
              AdaptiveDropdown<int>(
                value: ribbon.fontSize ?? 12,
                width: 60,
                items: _fontSizes.map((s) => (value: s, label: '$s')).toList(),
                onChanged: (v) => v != null ? doc.exec(FontSizeCommand(v)) : null,
              ),
              AdaptiveToggle(
                value: ribbon.isBold,
                onChanged: (_) => doc.exec(const BoldCommand()),
                icon: Icon(Icons.format_bold, size: 20),
                tooltip: 'Bold',
              ),
              AdaptiveToggle(
                value: ribbon.isItalic,
                onChanged: (_) => doc.exec(const ItalicCommand()),
                icon: Icon(Icons.format_italic, size: 20),
                tooltip: 'Italic',
              ),
              AdaptiveToggle(
                value: ribbon.isUnderline,
                onChanged: (_) => doc.exec(const UnderlineCommand()),
                icon: Icon(Icons.format_underlined, size: 20),
                tooltip: 'Underline',
              ),
            ],
          ),
          RibbonGroup(
            label: 'Paragraph',
            children: [
              AdaptiveToggle(
                value: ribbon.hasBullets,
                onChanged: (_) => doc.exec(const BulletsCommand()),
                icon: Icon(Icons.format_list_bulleted, size: 20),
                tooltip: 'Bullets',
              ),
              AdaptiveButton(
                icon: Icon(Icons.format_align_left, size: 20),
                onPressed: () => doc.exec(AlignmentCommand(TextAlign.left)),
                tooltip: 'Align Left',
              ),
              AdaptiveButton(
                icon: Icon(Icons.format_align_center, size: 20),
                onPressed: () => doc.exec(AlignmentCommand(TextAlign.center)),
                tooltip: 'Align Center',
              ),
              AdaptiveButton(
                icon: Icon(Icons.format_align_right, size: 20),
                onPressed: () => doc.exec(AlignmentCommand(TextAlign.right)),
                tooltip: 'Align Right',
              ),
              AdaptiveButton(
                icon: Icon(Icons.format_align_justify, size: 20),
                onPressed: () => doc.exec(AlignmentCommand(TextAlign.justify)),
                tooltip: 'Justify',
              ),
            ],
          ),
          RibbonGroup(
            label: 'Styles',
            children: [
              AdaptiveButton(icon: Text('Normal'), onPressed: () {}, tooltip: 'Normal'),
              AdaptiveButton(icon: Text('H1'), onPressed: () {}, tooltip: 'Heading 1'),
              AdaptiveButton(icon: Text('H2'), onPressed: () {}, tooltip: 'Heading 2'),
            ],
          ),
        ],
      ),
    );
  }
}
