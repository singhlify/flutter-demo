import 'package:flutter/material.dart';

import '../components/ribbon_group.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';

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
              AdaptiveButton(icon: Icon(Icons.image), onPressed: () {}, tooltip: 'Picture'),
              AdaptiveButton(icon: Icon(Icons.table_chart), onPressed: () {}, tooltip: 'Table'),
              AdaptiveButton(icon: Icon(Icons.link), onPressed: () {}, tooltip: 'Link'),
            ],
          ),
        ],
      ),
    );
  }
}
