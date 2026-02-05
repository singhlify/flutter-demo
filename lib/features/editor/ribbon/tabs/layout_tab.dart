import 'package:flutter/material.dart';

import '../components/ribbon_group.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';

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
              AdaptiveButton(icon: Icon(Icons.margin), onPressed: () {}, tooltip: 'Margins'),
              AdaptiveButton(icon: Icon(Icons.swap_horiz), onPressed: () {}, tooltip: 'Orientation'),
            ],
          ),
        ],
      ),
    );
  }
}
