import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../document/document_controller.dart';
import '../components/ribbon_group.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';

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
              AdaptiveButton(icon: Icon(Icons.spellcheck), onPressed: () {}, tooltip: 'Spelling'),
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
