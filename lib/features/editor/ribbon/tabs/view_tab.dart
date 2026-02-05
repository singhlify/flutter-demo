import 'package:flutter/material.dart';

import '../components/ribbon_group.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';

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
              AdaptiveButton(icon: Icon(Icons.zoom_in), onPressed: () {}, tooltip: 'Zoom'),
              AdaptiveButton(icon: Icon(Icons.straighten), onPressed: () {}, tooltip: 'Ruler'),
            ],
          ),
        ],
      ),
    );
  }
}
