import 'package:flutter/material.dart' show VisualDensity;
import 'package:fluent_ui/fluent_ui.dart';

/// Fluent theme with Segoe UI typography and Word-like density.
FluentThemeData get fluentThemeData => FluentThemeData(
      accentColor: Colors.blue,
      fontFamily: 'Segoe UI',
      visualDensity: VisualDensity.compact,
    );
