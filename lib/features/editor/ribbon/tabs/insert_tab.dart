import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// Insert tab: Pages, Tables, Illustrations, Add-ins, Media, Links, Comments, Header & Footer, Text, Symbols.
class InsertTab extends StatelessWidget {
  const InsertTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Pages',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.page, label: 'Cover\nPage', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.pageBreak, label: 'Blank\nPage', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.pageBreak, label: 'Page\nBreak', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Tables',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.table, label: 'Table', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Illustrations',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.image, label: 'Pictures', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.shapes, label: 'Shapes', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.icons, label: 'Icons', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.chart, label: 'Chart', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Header & Footer',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.header, label: 'Header', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.footer, label: 'Footer', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Text',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.textBox, label: 'Text\nBox', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.wordArt, label: 'WordArt', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Symbols',
          children: [
            RibbonLargeButton(icon: WordIcons.equation, label: 'Equation', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.symbol, label: 'Symbol', hasDropdown: true, onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
