import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../shared/word_icons.dart';
import '../components/ribbon_group.dart';

/// View tab: Views, Show, Zoom, Window, Macros.
class ViewTab extends StatelessWidget {
  const ViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RibbonGroup(
          label: 'Views',
          showTrailingDivider: true,
          children: [
            RibbonLargeButton(icon: WordIcons.readMode, label: 'Read\nMode', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.printLayout, label: 'Print\nLayout', onPressed: () {}),
            RibbonLargeButton(icon: WordIcons.webLayout, label: 'Web\nLayout', onPressed: () {}),
          ],
        ),
        RibbonGroup(
          label: 'Show',
          showTrailingDivider: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RibbonSmallButton(icon: WordIcons.ruler, tooltip: 'Ruler', onPressed: () {}),
                    const SizedBox(width: 4),
                    const Text('Ruler', style: TextStyle(fontSize: 11, color: Color(0xFF444444))),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    RibbonSmallButton(icon: WordIcons.borders, tooltip: 'Gridlines', onPressed: () {}),
                    const SizedBox(width: 4),
                    const Text('Gridlines', style: TextStyle(fontSize: 11, color: Color(0xFF444444))),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    RibbonSmallButton(icon: WordIcons.navigationPane, tooltip: 'Navigation Pane', onPressed: () {}),
                    const SizedBox(width: 4),
                    const Text('Navigation', style: TextStyle(fontSize: 11, color: Color(0xFF444444))),
                  ],
                ),
              ],
            ),
          ],
        ),
        RibbonGroup(
          label: 'Zoom',
          children: [
            RibbonLargeButton(icon: WordIcons.zoom, label: 'Zoom', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
