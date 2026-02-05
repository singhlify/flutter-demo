import 'package:flutter/material.dart';

import 'tokens.dart';

ThemeData get materialThemeData => ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.compact,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      // Desktop-friendly button and icon sizes
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: const EdgeInsets.all(Tokens.spacing8),
        ),
      ),
    );
