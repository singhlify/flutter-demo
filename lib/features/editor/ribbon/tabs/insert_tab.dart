import 'package:flutter/widgets.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';
import 'package:fluent_ui/fluent_ui.dart';

/// Insert tab: Picture, Table, Link (stubs).
class InsertTab extends StatelessWidget {
  const InsertTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'Insert',
            children: [
              Tooltip(message: 'Picture', child: IconButton(icon: Icon(WordIcons.image), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Table', child: IconButton(icon: Icon(WordIcons.table), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Link', child: IconButton(icon: Icon(WordIcons.link), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
            ],
          ),
        ],
      ),
    );
  }
}
