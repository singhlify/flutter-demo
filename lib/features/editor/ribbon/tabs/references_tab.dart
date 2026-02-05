import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// References tab: Table of Contents, Footnotes, Citations & Bibliography, Captions, Index.
class ReferencesTab extends StatelessWidget {
  const ReferencesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Table of Contents',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.tableOfContents, label: 'Table of\nContents', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Footnotes',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.footnote, label: 'Insert\nFootnote', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.footnote, label: 'Insert\nEndnote', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Citations & Bibliography',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.citation, label: 'Insert\nCitation', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.citation, label: 'Bibliography', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Captions',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.caption, label: 'Insert\nCaption', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Index',
          children: [
            RibbonLargeButton(icon: WordIcons.indexEntry, label: 'Mark\nEntry', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.indexEntry, label: 'Insert\nIndex', hasDropdown: true, onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
