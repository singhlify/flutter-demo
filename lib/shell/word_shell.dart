import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../features/editor/document/document_controller.dart';
import '../features/editor/ribbon/ribbon.dart';
import '../features/editor/page_canvas.dart';
import '../ribbon/commands.dart';
import '../shared/utils/shortcuts.dart';
import '../state/ribbon_state.dart';
import 'title_bar.dart';
import 'status_bar.dart';

/// Word-like shell: Title bar + Ribbon + Canvas + Status bar.
class WordShell extends StatelessWidget {
  const WordShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        boldShortcut: const BoldIntent(),
        italicShortcut: const ItalicIntent(),
        underlineShortcut: const UnderlineIntent(),
        undoShortcut: const UndoIntent(),
        redoShortcut: const RedoIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          BoldIntent: CallbackAction<BoldIntent>(onInvoke: (_) {
            context.read<DocumentController>().exec(const BoldCommand());
            return null;
          }),
          ItalicIntent: CallbackAction<ItalicIntent>(onInvoke: (_) {
            context.read<DocumentController>().exec(const ItalicCommand());
            return null;
          }),
          UnderlineIntent: CallbackAction<UnderlineIntent>(onInvoke: (_) {
            context.read<DocumentController>().exec(const UnderlineCommand());
            return null;
          }),
          UndoIntent: CallbackAction<UndoIntent>(onInvoke: (_) {
            context.read<DocumentController>().undo();
            return null;
          }),
          RedoIntent: CallbackAction<RedoIntent>(onInvoke: (_) {
            context.read<DocumentController>().redo();
            return null;
          }),
        },
        child: Focus(
          autofocus: true,
          child: const _WordShellBody(),
        ),
      ),
    );
  }
}

class _WordShellBody extends StatelessWidget {
  const _WordShellBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleBar(),
        const Ribbon(),
        const Expanded(
          child: PageCanvas(),
        ),
        const StatusBar(),
      ],
    );
  }
}
