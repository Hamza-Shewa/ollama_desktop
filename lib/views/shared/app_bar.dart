import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';

class OllamaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OllamaAppBar({
    this.title,
    this.showActions = true,
    this.leading,
    super.key,
  });
  final String? title;
  final bool showActions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        title: Text(title ?? 'Ollama'),
        centerTitle: true,
        leading: leading,
        actions: showActions
            ? [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    context.pushNamed(settings);
                  },
                ),
              ]
            : [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
