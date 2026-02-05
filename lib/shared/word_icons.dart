/// Fluent UI icons used across the Word-style app.
/// Uses fluentui_system_icons for MS Word-like appearance.
import 'package:flutter/widgets.dart' show IconData;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

/// Semantic Word ribbon icons from fluentui_system_icons.
class WordIcons {
  WordIcons._();

  // QAT
  static const IconData save = FluentIcons.document_save_24_regular;
  static const IconData undo = FluentIcons.arrow_undo_24_regular;
  static const IconData redo = FluentIcons.arrow_redo_24_regular;

  // Clipboard
  static const IconData paste = FluentIcons.clipboard_paste_24_regular;
  static const IconData cut = FluentIcons.cut_24_regular;
  static const IconData copy = FluentIcons.copy_24_regular;

  // Font
  static const IconData bold = FluentIcons.text_bold_24_regular;
  static const IconData italic = FluentIcons.text_italic_24_regular;
  static const IconData underline = FluentIcons.text_underline_24_regular;

  // Paragraph
  static const IconData bulletedList = FluentIcons.document_bullet_list_24_regular;
  static const IconData alignLeft = FluentIcons.align_left_24_regular;
  static const IconData alignCenter = FluentIcons.align_center_horizontal_24_regular;
  static const IconData alignRight = FluentIcons.align_right_24_regular;
  static const IconData alignJustify = FluentIcons.align_space_evenly_horizontal_24_regular;

  // Insert
  static const IconData image = FluentIcons.image_24_regular;
  static const IconData table = FluentIcons.document_table_24_regular;
  static const IconData link = FluentIcons.link_24_regular;

  // Layout
  static const IconData orientation = FluentIcons.arrow_rotate_clockwise_24_regular;
  static const IconData page = FluentIcons.document_24_regular;

  // Review
  static const IconData spelling = FluentIcons.document_search_24_regular;

  // View
  static const IconData search = FluentIcons.document_search_24_regular;
  static const IconData pageList = FluentIcons.document_bullet_list_24_regular;
}
