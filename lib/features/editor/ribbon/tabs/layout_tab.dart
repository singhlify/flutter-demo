import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// Layout tab: Page Setup, Paragraph, Arrange.
class LayoutTab extends StatelessWidget {
  const LayoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Page Setup',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.margins, label: 'Margins', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.orientation, label: 'Orientation', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.size, label: 'Size', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.columns, label: 'Columns', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.breaks, label: 'Breaks', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Paragraph',
          showTrailingDivider: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RibbonSmallButton(icon: WordIcons.decreaseIndent, tooltip: 'Indent Left', onPressed: () {}),
                    const SizedBox(width: 4),
                    RibbonSmallButton(icon: WordIcons.increaseIndent, tooltip: 'Indent Right', onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RibbonSmallButton(icon: WordIcons.lineSpacing, tooltip: 'Spacing Before', onPressed: () {}),
                    const SizedBox(width: 4),
                    RibbonSmallButton(icon: WordIcons.lineSpacing, tooltip: 'Spacing After', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
        RibbonGroup(
          label: 'Page Background',
          children: [
            RibbonLargeButton(icon: WordIcons.watermark, label: 'Watermark', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.pageColor, label: 'Page\nColor', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.pageBorders, label: 'Page\nBorders', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
