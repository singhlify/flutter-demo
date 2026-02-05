import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// Mailings tab: Create, Start Mail Merge, Write & Insert Fields, Preview, Finish (stubs matching MS Word).
class MailingsTab extends StatelessWidget {
  const MailingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Create',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.envelopes, label: 'Envelopes', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.labels, label: 'Labels', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Start Mail Merge',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(
              icon: WordIcons.startMailMerge,
              label: 'Start Mail\nMerge',
              hasDropdown: true,
              onPressed: () {},
            ),
            RibbonLargeButton(
              icon: WordIcons.selectRecipients,
              label: 'Select\nRecipients',
              hasDropdown: true,
              onPressed: () {},
            ),
          ],
        ),
        RibbonGroup(
          label: 'Write & Insert Fields',
          children: [
            RibbonSmallButton(icon: WordIcons.link, tooltip: 'Insert Merge Field', onPressed: () {}, hasDropdown: true),
          ],
        ),
      ],
    );
  }
}
