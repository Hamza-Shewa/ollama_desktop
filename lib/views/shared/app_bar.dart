import 'package:flutter/material.dart';

class OllamaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OllamaAppBar({
    this.title,
    this.showActions = true,
    this.leading,
    this.action = const [],
    super.key,
  });
  final String? title;
  final bool showActions;
  final Widget? leading;
  final List<Widget> action;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        title: Text(title ?? 'Ollama'),
        centerTitle: true,
        leading: leading,
        actions: showActions ? action : [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
