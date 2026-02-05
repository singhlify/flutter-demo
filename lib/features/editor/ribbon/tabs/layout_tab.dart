import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// Layout tab: Margins, Orientation (stubs).
class LayoutTab extends StatelessWidget {
  const LayoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonGroup(
            label: 'Page Setup',
            children: [
              Tooltip(message: 'Margins', child: IconButton(icon: Icon(WordIcons.page), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
              Tooltip(message: 'Orientation', child: IconButton(icon: Icon(WordIcons.orientation), onPressed: () {}, iconButtonMode: IconButtonMode.small)),
            ],
          ),
        ],
      ),
    );
  }
}
