import 'dart:ui' show Color;
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' show Colors;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../../app/theme/tokens.dart';
import 'document/document_controller.dart';

/// Gray workspace with centered white page, ruler placeholder, and QuillEditor.
/// Quill toolbar is not shown (formatting via ribbon only).
class PageCanvas extends StatelessWidget {
  const PageCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    return Container(
      color: const Color(0xFFE0E0E0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: Tokens.pageWidth,
            margin: const EdgeInsets.all(Tokens.pagePadding),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ruler placeholder - reserved height, no ruler logic yet
                SizedBox(
                  height: Tokens.rulerPlaceholderHeight,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Tokens.pagePadding * 2),
                  child: QuillEditor.basic(
                    controller: doc.controller,
                    config: const QuillEditorConfig(
                      // No toolbar - formatting via ribbon only
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
