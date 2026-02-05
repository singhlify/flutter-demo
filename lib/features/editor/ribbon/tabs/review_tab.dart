import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../../shared/word_icons.dart';
import '../../document/document_controller.dart';
import '../components/ribbon_group.dart';

/// Review tab: Spelling, Word count.
class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    final wordCount = doc.wordCount;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'Proofing',
            children: [
              Tooltip(message: 'Spelling', child: IconButton(icon: Icon(WordIcons.spelling), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Words: $wordCount'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
