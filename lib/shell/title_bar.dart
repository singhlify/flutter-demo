import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'quick_access_toolbar.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          const QuickAccessToolbar(),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Document1 – Word Ribbon PoC',
                  style: FluentTheme.of(context).typography.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
