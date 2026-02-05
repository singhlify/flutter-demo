import 'package:flutter/foundation.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../shared/utils/logging.dart';
import '../features/editor/document/document_controller.dart';

/// Ribbon UI state: selected tab and formatting toggle states.
class RibbonState extends ChangeNotifier {
  RibbonState(this._docController) {
    log('RibbonState: constructor called, attaching to DocumentController');
    _docController.addListener(_syncFromController);
    log('RibbonState: initialization complete');
  }

  final DocumentController _docController;

  @override
  void dispose() {
    _docController.removeListener(_syncFromController);
    super.dispose();
  }

  String _selectedTabId = 'home';
  String get selectedTabId => _selectedTabId;
  set selectedTabId(String value) {
    if (_selectedTabId != value) {
      _selectedTabId = value;
      notifyListeners();
    }
  }

  void _syncFromController() {
    notifyListeners();
  }

  bool get isBold {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.bold.key];
    return attr != null && attr.value == true;
  }

  bool get isItalic {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.italic.key];
    return attr != null && attr.value == true;
  }

  bool get isUnderline {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.underline.key];
    return attr != null && attr.value == true;
  }

  bool get hasBullets {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.ul.key];
    return attr != null;
  }

  int? get fontSize {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.size.key];
    if (attr == null || attr.value == null) return null;
    return attr.value is int ? attr.value as int : null;
  }

  String? get fontFamily {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.font.key];
    if (attr == null || attr.value == null) return null;
    return attr.value?.toString();
  }

  int? get fontColor {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.color.key];
    if (attr == null || attr.value == null) return null;
    return attr.value is int ? attr.value as int : null;
  }

  String get currentStyle {
    final style = _docController.getSelectionStyle();
    final attr = style.attributes[Attribute.header.key];
    if (attr == null || attr.value == null) return 'normal';
    final v = attr.value;
    if (v == 1) return 'h1';
    if (v == 2) return 'h2';
    return 'normal';
  }

  bool get hasUndo => _docController.hasUndo;
  bool get hasRedo => _docController.hasRedo;
}
