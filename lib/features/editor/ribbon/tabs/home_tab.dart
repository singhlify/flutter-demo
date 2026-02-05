import 'dart:ui' show TextAlign;
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../../shared/utils/logging.dart';
import '../../../../shared/word_icons.dart';
import '../../../../ribbon/commands.dart';
import '../../document/document_controller.dart';
import '../../../../state/ribbon_state.dart';
import '../components/ribbon_group.dart';

/// Home tab: Clipboard, Font, Paragraph, Styles.
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static const _fontSizes = [8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72];
  static const _fontFamilies = ['Segoe UI', 'Calibri', 'Arial', 'Times New Roman', 'Georgia'];
  static const _colors = [
    (0xFF000000, 'Black'),
    (0xFF0000FF, 'Blue'),
    (0xFF00FF00, 'Green'),
    (0xFFFF0000, 'Red'),
  ];

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
            showTrailingDivider: true,
            children: [
              Tooltip(message: 'Paste', child: IconButton(icon: Icon(WordIcons.paste), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Cut', child: IconButton(icon: Icon(WordIcons.cut), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Copy', child: IconButton(icon: Icon(WordIcons.copy), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
            ],
          ),
          RibbonGroup(
            label: 'Font',
            showTrailingDivider: true,
            children: [
              SizedBox(
                width: 100,
                child: ComboBox<String>(
                  value: ribbon.fontFamily ?? 'Segoe UI',
                  items: _fontFamilies.map((f) => ComboBoxItem<String>(value: f, child: Text(f))).toList(),
                  onChanged: (v) => v != null ? doc.exec(FontFamilyCommand(v)) : null,
                ),
              ),
              SizedBox(
                width: 60,
                child: ComboBox<int>(
                  value: ribbon.fontSize ?? 12,
                  items: _fontSizes.map((s) => ComboBoxItem<int>(value: s, child: Text('$s'))).toList(),
                  onChanged: (v) => v != null ? doc.exec(FontSizeCommand(v)) : null,
                ),
              ),
              Tooltip(message: 'Bold', child: ToggleButton(checked: ribbon.isBold, onChanged: (_) => doc.exec(const BoldCommand()), child: Icon(WordIcons.bold, size: 20))),
              Tooltip(message: 'Italic', child: ToggleButton(checked: ribbon.isItalic, onChanged: (_) => doc.exec(const ItalicCommand()), child: Icon(WordIcons.italic, size: 20))),
              Tooltip(message: 'Underline', child: ToggleButton(checked: ribbon.isUnderline, onChanged: (_) => doc.exec(const UnderlineCommand()), child: Icon(WordIcons.underline, size: 20))),
              SizedBox(
                width: 70,
                child: ComboBox<int>(
                  value: ribbon.fontColor ?? 0xFF000000,
                  items: _colors.map((c) => ComboBoxItem<int>(value: c.$1, child: Row(children: [Container(width: 12, height: 12, color: Color(c.$1)), SizedBox(width: 4), Text(c.$2)]))).toList(),
                  onChanged: (v) => v != null ? doc.exec(FontColorCommand(v)) : null,
                ),
              ),
            ],
          ),
          RibbonGroup(
            label: 'Paragraph',
            showTrailingDivider: true,
            children: [
              Tooltip(message: 'Bullets', child: ToggleButton(checked: ribbon.hasBullets, onChanged: (_) => doc.exec(const BulletsCommand()), child: Icon(WordIcons.bulletedList, size: 20))),
              Tooltip(message: 'Align Left', child: IconButton(icon: Icon(WordIcons.alignLeft, size: 20), onPressed: () => doc.exec(AlignmentCommand(TextAlign.left)), iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Align Center', child: IconButton(icon: Icon(WordIcons.alignCenter, size: 20), onPressed: () => doc.exec(AlignmentCommand(TextAlign.center)), iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Align Right', child: IconButton(icon: Icon(WordIcons.alignRight, size: 20), onPressed: () => doc.exec(AlignmentCommand(TextAlign.right)), iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Justify', child: IconButton(icon: Icon(WordIcons.alignJustify, size: 20), onPressed: () => doc.exec(AlignmentCommand(TextAlign.justify)), iconButtonMode: IconButtonMode.small)),
            ],
          ),
          RibbonGroup(
            label: 'Styles',
            children: [
              _StyleChip(label: 'Normal', selected: ribbon.currentStyle == 'normal', onTap: () => doc.exec(const StyleCommand('normal'))),
              _StyleChip(label: 'H1', selected: ribbon.currentStyle == 'h1', onTap: () => doc.exec(const StyleCommand('h1'))),
              _StyleChip(label: 'H2', selected: ribbon.currentStyle == 'h2', onTap: () => doc.exec(const StyleCommand('h2'))),
            ],
          ),
        ],
      ),
    );
  }
}

/// Word-style style chip (Normal, H1, H2) - clickable chip with selected state.
class _StyleChip extends StatelessWidget {
  const _StyleChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? FluentTheme.of(context).accentColor.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(4),
          border: selected ? Border.all(color: FluentTheme.of(context).accentColor) : null,
        ),
        child: Text(label, style: TextStyle(fontSize: 11, fontWeight: selected ? FontWeight.w600 : FontWeight.normal)),
      ),
    );
  }
}
