import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/editor/editor_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const EditorScreen(),
    ),
  ],
);
