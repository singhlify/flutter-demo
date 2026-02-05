import 'package:flutter/material.dart' show GlobalMaterialLocalizations;
import 'package:flutter/cupertino.dart' show GlobalCupertinoLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../../features/editor/document/document_controller.dart';
import '../../shell/word_shell.dart';
import '../../state/ribbon_state.dart';
import '../../state/zoom_state.dart';
import '../theme/fluent_theme.dart';

class WindowsShell extends StatelessWidget {
  const WindowsShell({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DocumentController()),
        ChangeNotifierProvider(create: (_) => ZoomState()),
        ChangeNotifierProxyProvider<DocumentController, RibbonState>(
          create: (context) => RibbonState(context.read<DocumentController>()),
          update: (_, doc, previous) => previous!,
        ),
      ],
      child: FluentApp(
        title: 'Word Ribbon PoC',
        theme: fluentThemeData,
        localizationsDelegates: const [
          FluentLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FlutterQuillLocalizations.delegate,
        ],
        supportedLocales: FluentLocalizations.supportedLocales,
        home: const WordShell(),
      ),
    );
  }
}
