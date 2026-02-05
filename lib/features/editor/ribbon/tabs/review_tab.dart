import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../../shared/word_icons.dart';
import '../../document/document_controller.dart';
import '../components/ribbon_group.dart';

/// Review tab: Proofing, Language, Comments, Tracking, Changes, Compare, Protect.
class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Proofing',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.spelling, label: 'Spelling &\nGrammar', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.thesaurus, label: 'Thesaurus', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.wordCount, label: 'Word\nCount', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Language',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.translate, label: 'Translate', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Comments',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.newComment, label: 'New\nComment', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Tracking',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.trackChanges, label: 'Track\nChanges', hasDropdown: true, onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Changes',
          children: [
            RibbonLargeButton(icon: WordIcons.acceptChange, label: 'Accept', hasDropdown: true, onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.rejectChange, label: 'Reject', hasDropdown: true, onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
