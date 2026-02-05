import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../../app/theme/tokens.dart';
import '../../shared/utils/logging.dart';
import '../../shared/utils/shortcuts.dart';
import 'document/commands.dart';
import 'document/document_controller.dart';
import 'ribbon/ribbon.dart';

/// Main editor screen: QAT, Ribbon, Editor, Status Bar.
class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('EditorScreen: building Shortcuts/Actions/Material tree');
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
        child: Material(
          child: Focus(
            autofocus: true,
            child: const _EditorBody(),
          ),
        ),
      ),
    );
  }
}

class _EditorBody extends StatelessWidget {
  const _EditorBody();

  @override
  Widget build(BuildContext context) {
    log('_EditorBody: watching DocumentController');
    final doc = context.watch<DocumentController>();
    log('_EditorBody: doc.wordCount=${doc.wordCount}');

    return Column(
      children: [
        _QuickAccessToolbar(doc: doc),
        const Ribbon(),
        Expanded(
          child: Container(
            color: Colors.grey.shade200,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: Tokens.pageWidth,
                  margin: const EdgeInsets.all(Tokens.pagePadding),
                  padding: const EdgeInsets.all(Tokens.pagePadding * 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: QuillEditor.basic(
                    controller: doc.controller,
                    config: QuillEditorConfig(
                      customStyleBuilder: (attribute) => TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        _StatusBar(doc: doc),
      ],
    );
  }
}

class _QuickAccessToolbar extends StatelessWidget {
  const _QuickAccessToolbar({required this.doc});

  final DocumentController doc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Tokens.qatHeight,
      child: Row(
        children: [
          _QatButton(icon: Icons.save, tooltip: 'Save', onPressed: () {}),
          _QatButton(icon: Icons.undo, tooltip: 'Undo', onPressed: doc.hasUndo ? doc.undo : null),
          _QatButton(icon: Icons.redo, tooltip: 'Redo', onPressed: doc.hasRedo ? doc.redo : null),
        ],
      ),
    );
  }
}

class _QatButton extends StatelessWidget {
  const _QatButton({required this.icon, required this.tooltip, required this.onPressed});

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar({required this.doc});

  final DocumentController doc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Tokens.statusBarHeight,
      child: Row(
        children: [
          const Text('Page 1'),
          const SizedBox(width: 16),
          Text('Words: ${doc.wordCount}'),
          const Spacer(),
          const Text('100%'),
        ],
      ),
    );
  }
}
