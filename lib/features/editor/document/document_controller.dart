import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../shared/utils/logging.dart';
import '../../../ribbon/commands.dart';

/// Wraps QuillController and exposes formatting commands.
class DocumentController extends ChangeNotifier {
  DocumentController() {
    log('DocumentController: constructor called');
    _controller = QuillController(
      document: _createSampleDocument(),
      selection: const TextSelection.collapsed(offset: 0),
      config: const QuillControllerConfig(),
    );
    _controller.addListener(_onControllerChanged);
    log('DocumentController: initialized with sample document');
  }

  late final QuillController _controller;
  QuillController get controller => _controller;

  void _onControllerChanged() {
    notifyListeners();
  }

  Document _createSampleDocument() {
    return Document.fromJson([
      {'insert': '\n'},
    ]);
  }

  bool get hasUndo => _controller.hasUndo;
  bool get hasRedo => _controller.hasRedo;

  void undo() => _controller.undo();
  void redo() => _controller.redo();

  /// Returns the current selection style for ribbon toggle sync.
  Style getSelectionStyle() => _controller.getSelectionStyle();

  void exec(Command command) {
    switch (command) {
      case BoldCommand():
        _toggleAttribute(Attribute.bold);
      case ItalicCommand():
        _toggleAttribute(Attribute.italic);
      case UnderlineCommand():
        _toggleAttribute(Attribute.underline);
      case FontSizeCommand(:final size):
        _controller.formatSelection(
          Attribute.fromKeyValue(Attribute.size.key, size) ?? Attribute.size,
          shouldNotifyListeners: true,
        );
      case FontFamilyCommand(:final fontFamily):
        _controller.formatSelection(
          Attribute.fromKeyValue(Attribute.font.key, fontFamily) ?? Attribute.font,
          shouldNotifyListeners: true,
        );
      case FontColorCommand(:final colorValue):
        _controller.formatSelection(
          Attribute.fromKeyValue(Attribute.color.key, colorValue) ?? Attribute.color,
          shouldNotifyListeners: true,
        );
      case AlignmentCommand(:final align):
        final attr = switch (align) {
          TextAlign.left => Attribute.leftAlignment,
          TextAlign.center => Attribute.centerAlignment,
          TextAlign.right => Attribute.rightAlignment,
          TextAlign.justify => Attribute.justifyAlignment,
          _ => Attribute.leftAlignment,
        };
        _controller.formatSelection(attr, shouldNotifyListeners: true);
      case BulletsCommand():
        _toggleAttribute(Attribute.ul);
      case StyleCommand(:final style):
        _applyStyle(style);
      case UndoCommand():
        undo();
      case RedoCommand():
        redo();
    }
  }

  void _applyStyle(String style) {
    if (style == 'h1') {
      _controller.formatSelection(Attribute.fromKeyValue(Attribute.header.key, 1) ?? Attribute.header, shouldNotifyListeners: true);
    } else if (style == 'h2') {
      _controller.formatSelection(Attribute.fromKeyValue(Attribute.header.key, 2) ?? Attribute.header, shouldNotifyListeners: true);
    } else {
      _controller.formatSelection(Attribute.fromKeyValue(Attribute.header.key, null) ?? Attribute.header, shouldNotifyListeners: true);
    }
  }

  void _toggleAttribute(Attribute attribute) {
    final style = _controller.getSelectionStyle();
    final current = style.attributes[attribute.key];
    if (current != null && current.value != null) {
      _controller.formatSelection(Attribute.clone(attribute, null), shouldNotifyListeners: true);
    } else {
      _controller.formatSelection(attribute, shouldNotifyListeners: true);
    }
  }

  int get wordCount {
    final text = _controller.document.toPlainText();
    if (text.trim().isEmpty) return 0;
    return text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _controller.dispose();
    super.dispose();
  }
}
