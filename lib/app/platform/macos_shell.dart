import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';

import '../../features/editor/document/document_controller.dart';
import '../../features/editor/editor_screen.dart';
import '../../features/editor/ribbon/ribbon_state.dart';
import '../theme/macos_theme.dart';

class MacosShell extends StatelessWidget {
  const MacosShell({super.key});

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
      child: MacosApp(
        title: 'Word Ribbon PoC',
        theme: MacosThemeData(brightness: macosBrightness),
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
