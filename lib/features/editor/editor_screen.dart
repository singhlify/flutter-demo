import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../shared/utils/logging.dart';
import 'document/document_controller.dart';
import 'ribbon/ribbon.dart';
import 'page_canvas.dart';

/// Editor screen: Ribbon + Page canvas.
class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('EditorScreen: building');
    return Column(
      children: [
        const Ribbon(),
        Expanded(
          child: const PageCanvas(),
        ),
      ],
    );
  }
}
