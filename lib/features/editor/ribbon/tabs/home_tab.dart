import 'dart:ui' show TextAlign;
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../../shared/word_icons.dart';
import '../../../../ribbon/commands.dart';
import '../../document/document_controller.dart';
import '../../../../state/ribbon_state.dart';
import '../components/ribbon_group.dart';

/// Home tab: Clipboard, Font, Paragraph, Styles, Editing, Adobe Acrobat, Voice, Sensitivity, Add-ins, Editor, Copilot
/// Matches MS Word's Home tab layout exactly.
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static const _fontSizes = [8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72];
  static const _fontFamilies = ['Aptos (Body)', 'Calibri', 'Arial', 'Times New Roman', 'Segoe UI', 'Georgia'];

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    final ribbon = context.watch<RibbonState>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Clipboard group
        _ClipboardGroup(),
        // Font group
        _FontGroup(doc: doc, ribbon: ribbon),
        // Paragraph group
        _ParagraphGroup(doc: doc, ribbon: ribbon),
        // Styles group
        _StylesGroup(),
        // Editing group
        _LargeButtonGroup(
          icon: WordIcons.editing,
          label: 'Editing',
          hasDropdown: true,
          showDivider: true,
        ),
        // Adobe Acrobat group
        _LargeButtonGroup(
          icon: WordIcons.createPdf,
          label: 'Create\na PDF',
          groupLabel: 'Adobe Acrobat',
          showDivider: true,
        ),
        // Voice group
        _LargeButtonGroup(
          icon: WordIcons.dictate,
          label: 'Dictate',
          groupLabel: 'Voice',
          hasDropdown: true,
          showDivider: true,
        ),
        // Sensitivity group
        _LargeButtonGroup(
          icon: WordIcons.sensitivity,
          label: 'Sensitivity',
          groupLabel: 'Sensitivity',
          hasDropdown: true,
          showDivider: true,
        ),
        // Add-ins group
        _LargeButtonGroup(
          icon: WordIcons.addIns,
          label: 'Add-ins',
          groupLabel: 'Add-ins',
          hasDropdown: true,
          showDivider: true,
        ),
        // Editor & Copilot group
        _EditorCopilotGroup(),
      ],
    );
  }
}

/// Clipboard: Paste (large), Cut, Copy, Format Painter
class _ClipboardGroup extends StatelessWidget {
  const _ClipboardGroup();

  @override
  Widget build(BuildContext context) {
    return RibbonGroup(
      label: 'Clipboard',
      showTrailingDivider: true,
      children: [
        // Large Paste button
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RibbonLargeButton(
              icon: WordIcons.paste,
              label: 'Paste',
              hasDropdown: true,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(width: 2),
        // Small buttons column: Cut, Copy, Format Painter
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RibbonSmallButton(icon: WordIcons.cut, tooltip: 'Cut', onPressed: () {}),
            const SizedBox(height: 1),
            RibbonSmallButton(icon: WordIcons.copy, tooltip: 'Copy', onPressed: () {}),
            const SizedBox(height: 1),
            RibbonSmallButton(icon: WordIcons.formatPainter, tooltip: 'Format Painter', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

/// Font group: font family, size, B I U abc x2 x2, text effects, font color, highlight, change case
class _FontGroup extends StatelessWidget {
  const _FontGroup({required this.doc, required this.ribbon});

  final DocumentController doc;
  final RibbonState ribbon;

  @override
  Widget build(BuildContext context) {
    return RibbonGroup(
      label: 'Font',
      showTrailingDivider: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: font family + font size
            Row(
              children: [
                // Font family dropdown
                Container(
                  width: 130,
                  height: 22,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFBBBBBB)),
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          ribbon.fontFamily ?? 'Aptos (Body)',
                          style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(FluentIcons.chevron_down_12_regular, size: 10, color: Color(0xFF888888)),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                // Font size dropdown
                Container(
                  width: 42,
                  height: 22,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFBBBBBB)),
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${ribbon.fontSize ?? 12}',
                          style: const TextStyle(fontSize: 11, color: Color(0xFF333333)),
                        ),
                      ),
                      const Icon(FluentIcons.chevron_down_12_regular, size: 10, color: Color(0xFF888888)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            // Middle row: B I U abc x2 x2 text-effects clear-formatting
            Row(
              children: [
                RibbonSmallButton(
                  icon: WordIcons.bold,
                  tooltip: 'Bold',
                  isToggled: ribbon.isBold,
                  onPressed: () => doc.exec(const BoldCommand()),
                ),
                RibbonSmallButton(
                  icon: WordIcons.italic,
                  tooltip: 'Italic',
                  isToggled: ribbon.isItalic,
                  onPressed: () => doc.exec(const ItalicCommand()),
                ),
                RibbonSmallButton(
                  icon: WordIcons.underline,
                  tooltip: 'Underline',
                  isToggled: ribbon.isUnderline,
                  onPressed: () => doc.exec(const UnderlineCommand()),
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.strikethrough,
                  tooltip: 'Strikethrough',
                  onPressed: () {},
                ),
                RibbonSmallButton(
                  icon: WordIcons.subscript,
                  tooltip: 'Subscript',
                  onPressed: () {},
                ),
                RibbonSmallButton(
                  icon: WordIcons.superscript,
                  tooltip: 'Superscript',
                  onPressed: () {},
                ),
                RibbonSmallButton(
                  icon: WordIcons.textEffects,
                  tooltip: 'Text Effects',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 1),
            // Bottom row: Font Color (A with red underline), Highlight, Change Case, Grow/Shrink
            Row(
              children: [
                RibbonSmallButton(
                  icon: WordIcons.fontColor,
                  tooltip: 'Font Color',
                  onPressed: () {},
                  underlineColor: const Color(0xFFFF0000),
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.highlight,
                  tooltip: 'Text Highlight Color',
                  onPressed: () {},
                  hasDropdown: true,
                  underlineColor: const Color(0xFFFFFF00),
                ),
                RibbonSmallButton(
                  icon: WordIcons.changeCase,
                  tooltip: 'Change Case',
                  onPressed: () {},
                  hasDropdown: true,
                ),
                // Grow/Shrink font
                RibbonSmallButton(
                  icon: WordIcons.clearFormatting,
                  tooltip: 'Clear Formatting',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// Paragraph group: bullets, numbering, multilevel, decrease/increase indent,
/// alignment (left, center, right, justify), line spacing, shading, borders, sort, show/hide
class _ParagraphGroup extends StatelessWidget {
  const _ParagraphGroup({required this.doc, required this.ribbon});

  final DocumentController doc;
  final RibbonState ribbon;

  @override
  Widget build(BuildContext context) {
    return RibbonGroup(
      label: 'Paragraph',
      showTrailingDivider: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: bullets, numbering, multilevel, decrease/increase indent
            Row(
              children: [
                RibbonSmallButton(
                  icon: WordIcons.bulletedList,
                  tooltip: 'Bullets',
                  isToggled: ribbon.hasBullets,
                  onPressed: () => doc.exec(const BulletsCommand()),
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.numberedList,
                  tooltip: 'Numbering',
                  onPressed: () {},
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.multilevelList,
                  tooltip: 'Multilevel List',
                  onPressed: () {},
                  hasDropdown: true,
                ),
                const SizedBox(width: 4),
                RibbonSmallButton(
                  icon: WordIcons.decreaseIndent,
                  tooltip: 'Decrease Indent',
                  onPressed: () {},
                ),
                RibbonSmallButton(
                  icon: WordIcons.increaseIndent,
                  tooltip: 'Increase Indent',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 3),
            // Middle row: alignment (left, center, right, justify), line spacing
            Row(
              children: [
                RibbonSmallButton(
                  icon: WordIcons.alignLeft,
                  tooltip: 'Align Left',
                  onPressed: () => doc.exec(AlignmentCommand(TextAlign.left)),
                ),
                RibbonSmallButton(
                  icon: WordIcons.alignCenter,
                  tooltip: 'Center',
                  onPressed: () => doc.exec(AlignmentCommand(TextAlign.center)),
                ),
                RibbonSmallButton(
                  icon: WordIcons.alignRight,
                  tooltip: 'Align Right',
                  onPressed: () => doc.exec(AlignmentCommand(TextAlign.right)),
                ),
                RibbonSmallButton(
                  icon: WordIcons.alignJustify,
                  tooltip: 'Justify',
                  onPressed: () => doc.exec(AlignmentCommand(TextAlign.justify)),
                ),
                RibbonSmallButton(
                  icon: WordIcons.lineSpacing,
                  tooltip: 'Line Spacing',
                  onPressed: () {},
                  hasDropdown: true,
                ),
              ],
            ),
            const SizedBox(height: 1),
            // Bottom row: shading, borders, sort, show/hide paragraph marks
            Row(
              children: [
                RibbonSmallButton(
                  icon: WordIcons.shading,
                  tooltip: 'Shading',
                  onPressed: () {},
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.borders,
                  tooltip: 'Borders',
                  onPressed: () {},
                  hasDropdown: true,
                ),
                RibbonSmallButton(
                  icon: WordIcons.sortAscending,
                  tooltip: 'Sort',
                  onPressed: () {},
                ),
                RibbonSmallButton(
                  icon: WordIcons.showHide,
                  tooltip: 'Show/Hide',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// Styles group with large "A" Styles button
class _StylesGroup extends StatelessWidget {
  const _StylesGroup();

  @override
  Widget build(BuildContext context) {
    return RibbonGroup(
      label: 'Styles',
      showTrailingDivider: true,
      children: [
        RibbonLargeButton(
          icon: WordIcons.styles,
          label: 'Styles',
          hasDropdown: true,
          iconColor: const Color(0xFF2B579A),
          iconSize: 32,
          onPressed: () {},
        ),
      ],
    );
  }
}

/// Generic large button group (Editing, Adobe, Voice, Sensitivity, Add-ins)
class _LargeButtonGroup extends StatelessWidget {
  const _LargeButtonGroup({
    required this.icon,
    required this.label,
    this.groupLabel,
    this.hasDropdown = false,
    this.showDivider = false,
  });

  final IconData icon;
  final String label;
  final String? groupLabel;
  final bool hasDropdown;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return RibbonGroup(
      label: groupLabel ?? label,
      showTrailingDivider: showDivider,
      children: [
        RibbonLargeButton(
          icon: icon,
          label: label,
          hasDropdown: hasDropdown,
          onPressed: () {},
        ),
      ],
    );
  }
}

/// Editor + Copilot group
class _EditorCopilotGroup extends StatelessWidget {
  const _EditorCopilotGroup();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RibbonLargeButton(
            icon: WordIcons.editor,
            label: 'Editor',
            onPressed: () {},
          ),
          RibbonLargeButton(
            icon: WordIcons.copilot,
            label: 'Copilot',
            iconColor: const Color(0xFF7B83EB),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
