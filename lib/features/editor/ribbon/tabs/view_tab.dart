import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// View tab: Zoom, Ruler (stubs).
class ViewTab extends StatelessWidget {
  const ViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'View',
            children: [
              Tooltip(message: 'Zoom', child: IconButton(icon: Icon(WordIcons.search), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Page view', child: IconButton(icon: Icon(WordIcons.pageList), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
            ],
          ),
        ],
      ),
    );
  }
}
