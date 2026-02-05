import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../../features/editor/document/document_controller.dart';
import '../../features/editor/editor_screen.dart';
import '../../features/editor/ribbon/ribbon_state.dart';
import '../../shared/utils/logging.dart';
import '../theme/material_theme.dart';

class DefaultShell extends StatelessWidget {
  const DefaultShell({super.key});

  @override
  Widget build(BuildContext context) {
    log('DefaultShell: building MultiProvider with DocumentController + RibbonState');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DocumentController()),
        ChangeNotifierProxyProvider<DocumentController, RibbonState>(
          create: (context) => RibbonState(context.read<DocumentController>()),
          update: (_, doc, previous) => previous!,
        ),
      ],
      child: MaterialApp(
        title: 'Word Ribbon PoC',
        theme: materialThemeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FlutterQuillLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        home: const EditorScreen(),
      ),
    );
  }
}
