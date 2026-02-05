import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../app/theme/tokens.dart';
import '../shared/word_icons.dart';
import '../features/editor/document/document_controller.dart';

class QuickAccessToolbar extends StatelessWidget {
  const QuickAccessToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    return SizedBox(
      height: Tokens.qatHeight,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Tooltip(
              message: 'Save',
              child: IconButton(
                icon: Icon(WordIcons.save),
                onPressed: () {},
                iconButtonMode: IconButtonMode.small,
              ),
            ),
          ),
          Tooltip(
            message: 'Undo',
            child: IconButton(
              icon: Icon(WordIcons.undo),
              onPressed: doc.hasUndo ? doc.undo : null,
              iconButtonMode: IconButtonMode.small,
            ),
          ),
          Tooltip(
            message: 'Redo',
            child: IconButton(
              icon: Icon(WordIcons.redo),
              onPressed: doc.hasRedo ? doc.redo : null,
              iconButtonMode: IconButtonMode.small,
            ),
          ),
        ],
      ),
    );
  }
}
