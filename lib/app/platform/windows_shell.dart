import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../features/editor/document/document_controller.dart';
import '../../features/editor/editor_screen.dart';
import '../../features/editor/ribbon/ribbon_state.dart';
import '../theme/fluent_theme.dart';

class WindowsShell extends StatelessWidget {
  const WindowsShell({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DocumentController()),
        ChangeNotifierProxyProvider<DocumentController, RibbonState>(
          create: (context) => RibbonState(context.read<DocumentController>()),
          update: (_, doc, previous) => previous!,
        ),
      ],
      child: FluentApp(
        title: 'Word Ribbon PoC',
        theme: fluentThemeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FlutterQuillLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],
        home: const EditorScreen(),
      ),
    );
  }
}
