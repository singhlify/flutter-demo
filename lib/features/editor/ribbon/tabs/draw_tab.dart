import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// Draw tab: Drawing Tools, Pens, Convert, Insert (stubs matching MS Word).
class DrawTab extends StatelessWidget {
  const DrawTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Tools',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.draw, label: 'Draw', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.eraser, label: 'Eraser', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Pens',
          showTrailingDivider: true,
          children: [
            RibbonSmallButton(icon: WordIcons.pen, tooltip: 'Pen', onPressed: () {}),
            RibbonSmallButton(icon: WordIcons.pencil, tooltip: 'Pencil', onPressed: () {}),
            RibbonSmallButton(icon: WordIcons.highlighterDraw, tooltip: 'Highlighter', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Convert',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.inkToShape, label: 'Ink to\nShape', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.inkToText, label: 'Ink to\nText', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.mathInk, label: 'Ink to\nMath', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Insert',
          children: [
            RibbonLargeButton(icon: WordIcons.ruler, label: 'Ruler', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
