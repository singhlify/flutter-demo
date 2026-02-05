import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../components/ribbon_group.dart';
import '../../../../shared/word_icons.dart';

/// References tab: Citations, Bibliography (placeholders).
class ReferencesTab extends StatelessWidget {
  const ReferencesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'Citations',
            showTrailingDivider: true,
            children: [
              IconButton(icon: Icon(WordIcons.link), onPressed: () {}, iconButtonMode: IconButtonMode.small),
            ],
          ),
          RibbonGroup(
            label: 'Bibliography',
            children: [
              IconButton(icon: Icon(WordIcons.pageList), onPressed: () {}, iconButtonMode: IconButtonMode.small),
            ],
          ),
        ],
      ),
    );
  }
}
