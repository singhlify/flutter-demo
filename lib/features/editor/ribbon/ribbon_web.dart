import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../../shared/utils/logging.dart';
import '../../../state/ribbon_state.dart';
import 'tabs/home_tab.dart';
import 'tabs/insert_tab.dart';
import 'tabs/layout_tab.dart';
import 'tabs/references_tab.dart';
import 'tabs/review_tab.dart';
import 'tabs/view_tab.dart';

/// Word-style ribbon with tabs and content panel.
class Ribbon extends StatelessWidget {
  const Ribbon({super.key});

  static const _tabs = [
    ('home', 'Home'),
    ('insert', 'Insert'),
    ('layout', 'Layout'),
    ('references', 'References'),
    ('review', 'Review'),
    ('view', 'View'),
  ];

  @override
  Widget build(BuildContext context) {
    log('Ribbon: watching RibbonState');
    final ribbon = context.watch<RibbonState>();
    final theme = FluentTheme.of(context);
    log('Ribbon: selectedTabId=${ribbon.selectedTabId}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTabBar(context, ribbon, theme),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: theme.micaBackgroundColor.withValues(alpha: 0.5),
            border: Border(
              bottom: BorderSide(color: theme.resources.surfaceStrokeColorDefault),
            ),
          ),
          child: _buildContent(ribbon.selectedTabId),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context, RibbonState ribbon, FluentThemeData theme) {
    final accentColor = theme.accentColor.defaultBrushFor(theme.brightness);
    final textColor = theme.iconTheme.color ?? Colors.black;

    return Row(
      children: _tabs.map<Widget>((t) {
        final selected = t.$1 == ribbon.selectedTabId;
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                onPressed: () => ribbon.selectedTabId = t.$1,
                style: ButtonStyle(
                  backgroundColor: ButtonState.resolveWith((states) => Colors.transparent),
                  foregroundColor: ButtonState.resolveWith((states) {
                    if (selected) return accentColor;
                    return textColor;
                  }),
                ),
                child: Text(t.$2),
              ),
              if (selected)
                Container(
                  height: 2,
                  margin: const EdgeInsets.only(top: 2),
                  color: accentColor,
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContent(String tabId) {
    return switch (tabId) {
      'home' => const HomeTab(),
      'insert' => const InsertTab(),
      'layout' => const LayoutTab(),
      'references' => const ReferencesTab(),
      'review' => const ReviewTab(),
      'view' => const ViewTab(),
      _ => const HomeTab(),
    };
  }
}
