import 'dart:ui' show Color;
import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' show Colors, FluentIcons;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../../app/theme/tokens.dart';
import 'document/document_controller.dart';

/// Gray workspace with horizontal ruler, vertical ruler, and a centered white document page.
/// Matches MS Word's page canvas layout.
class PageCanvas extends StatelessWidget {
  const PageCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final doc = context.watch<DocumentController>();
    return Container(
      color: const Color(0xFFDDDDDD),
      child: Column(
        children: [
          // Horizontal ruler
          const HorizontalRuler(),
          // Main area: vertical ruler + page
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vertical ruler
                const VerticalRuler(),
                // Document page
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: Tokens.pageWidth,
                        constraints: const BoxConstraints(minHeight: 792),
                        margin: const EdgeInsets.only(top: 12, bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 72,
                            vertical: 72,
                          ),
                          child: QuillEditor.basic(
                            controller: doc.controller,
                            config: const QuillEditorConfig(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Right scrollbar area
                Container(
                  width: 16,
                  color: const Color(0xFFE8E8E8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Horizontal ruler with inch markings like MS Word
class HorizontalRuler extends StatelessWidget {
  const HorizontalRuler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: const Color(0xFFE8E8E8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            size: Size(constraints.maxWidth, 20),
            painter: _HorizontalRulerPainter(),
          );
        },
      ),
    );
  }
}

class _HorizontalRulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBBBBBB)
      ..strokeWidth = 0.5;

    // Bottom border
    canvas.drawLine(
      Offset(0, size.height - 0.5),
      Offset(size.width, size.height - 0.5),
      paint,
    );

    // Calculate ruler center based on page width
    final center = size.width / 2;
    final pageHalfWidth = Tokens.pageWidth / 2;
    final startX = center - pageHalfWidth;

    // Margin indicators (gray areas)
    final marginPaint = Paint()..color = const Color(0xFFCCCCCC);
    // Left margin area
    canvas.drawRect(Rect.fromLTRB(startX, 0, startX + 72, size.height), marginPaint);
    // Right margin area
    canvas.drawRect(Rect.fromLTRB(center + pageHalfWidth - 72, 0, center + pageHalfWidth, size.height), marginPaint);

    // Draw ruler markings (every inch = 96 pixels at 100% zoom, scaled to 72 for this layout)
    final tickPaint = Paint()
      ..color = const Color(0xFF888888)
      ..strokeWidth = 0.5;

    final textStyle = const TextStyle(
      color: Color(0xFF888888),
      fontSize: 8,
    );

    // Ruler goes from 0 to ~16 inches
    for (int i = 0; i <= 17; i++) {
      final x = startX + (i * (Tokens.pageWidth / 8.5));
      if (x < 0 || x > size.width) continue;

      // Major tick (numbered)
      canvas.drawLine(
        Offset(x, 4),
        Offset(x, size.height - 4),
        tickPaint,
      );

      // Number label
      if (i > 0 && i < 17) {
        final textPainter = TextPainter(
          text: TextSpan(text: '$i', style: textStyle),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, (size.height - textPainter.height) / 2));
      }

      // Minor ticks (half-inch and quarter-inch)
      if (i < 17) {
        final halfX = x + (Tokens.pageWidth / 17);
        if (halfX > 0 && halfX < size.width) {
          canvas.drawLine(
            Offset(halfX, 7),
            Offset(halfX, size.height - 7),
            tickPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Vertical ruler with inch markings like MS Word
class VerticalRuler extends StatelessWidget {
  const VerticalRuler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      color: const Color(0xFFE8E8E8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            size: Size(20, constraints.maxHeight),
            painter: _VerticalRulerPainter(),
          );
        },
      ),
    );
  }
}

class _VerticalRulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFBBBBBB)
      ..strokeWidth = 0.5;

    // Right border
    canvas.drawLine(
      Offset(size.width - 0.5, 0),
      Offset(size.width - 0.5, size.height),
      paint,
    );

    final tickPaint = Paint()
      ..color = const Color(0xFF888888)
      ..strokeWidth = 0.5;

    final textStyle = const TextStyle(
      color: Color(0xFF888888),
      fontSize: 8,
    );

    // Draw vertical ruler markings
    final pageTop = 12.0; // margin from top to page start
    final inchHeight = 72.0; // pixels per inch

    for (int i = 0; i <= 11; i++) {
      final y = pageTop + (i * inchHeight);
      if (y > size.height) break;

      // Major tick
      canvas.drawLine(
        Offset(4, y),
        Offset(size.width - 4, y),
        tickPaint,
      );

      // Number label
      if (i > 0 && i < 11) {
        final textPainter = TextPainter(
          text: TextSpan(text: '$i', style: textStyle),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset((size.width - textPainter.width) / 2, y - textPainter.height / 2));
      }

      // Half-inch ticks
      if (i < 11) {
        final halfY = y + inchHeight / 2;
        if (halfY < size.height) {
          canvas.drawLine(
            Offset(7, halfY),
            Offset(size.width - 7, halfY),
            tickPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
