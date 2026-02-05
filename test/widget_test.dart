import 'package:flutter_test/flutter_test.dart';
import 'package:word_ribbon_poc/features/editor/document/document_controller.dart';

void main() {
  test('DocumentController has sample content', () {
    final controller = DocumentController();
    addTearDown(controller.dispose);
    expect(controller.controller.document.toPlainText(), contains('Word Ribbon PoC'));
    expect(controller.hasUndo, isFalse);
  });
}
