import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/utils/logging.dart';
import 'ribbon_state.dart';
import 'tabs/home_tab.dart';
import 'tabs/insert_tab.dart';
import 'tabs/layout_tab.dart';
import 'tabs/review_tab.dart';
import 'tabs/view_tab.dart';

/// Word-style ribbon with tabs and content panel (Material for web).
class Ribbon extends StatelessWidget {
  const Ribbon({super.key});

  static const _tabs = [
    ('home', 'Home'),
    ('insert', 'Insert'),
    ('layout', 'Layout'),
    ('review', 'Review'),
    ('view', 'View'),
  ];

  @override
  Widget build(BuildContext context) {
    log('Ribbon: watching RibbonState');
    final ribbon = context.watch<RibbonState>();
    log('Ribbon: selectedTabId=${ribbon.selectedTabId}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTabBar(context, ribbon),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: _buildContent(ribbon.selectedTabId),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context, RibbonState ribbon) {
    return Row(
      children: _tabs.map<Widget>((t) {
        final selected = t.$1 == ribbon.selectedTabId;
        return TextButton(
          onPressed: () => ribbon.selectedTabId = t.$1,
          style: TextButton.styleFrom(
            foregroundColor: selected ? Theme.of(context).colorScheme.primary : null,
          ),
          child: Text(t.$2),
        );
      }).toList(),
    );
  }

  Widget _buildContent(String tabId) {
    return switch (tabId) {
      'home' => const HomeTab(),
      'insert' => const InsertTab(),
      'layout' => const LayoutTab(),
      'review' => const ReviewTab(),
      'view' => const ViewTab(),
      _ => const HomeTab(),
    };
  }
}
