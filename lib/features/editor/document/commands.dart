import 'package:flutter/material.dart';

/// Formatting and editing commands for the document.
sealed class Command {
  const Command();
}

class BoldCommand extends Command {
  const BoldCommand();
}

class ItalicCommand extends Command {
  const ItalicCommand();
}

class UnderlineCommand extends Command {
  const UnderlineCommand();
}

class FontSizeCommand extends Command {
  final int size;
  const FontSizeCommand(this.size);
}

class AlignmentCommand extends Command {
  final TextAlign align;
  const AlignmentCommand(this.align);
}

class BulletsCommand extends Command {
  const BulletsCommand();
}

class UndoCommand extends Command {
  const UndoCommand();
}

class RedoCommand extends Command {
  const RedoCommand();
}
