import 'package:flutter/material.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OllamaAppBar(),
      body: const Center(
        child: Text('Error'),
      ),
    );
  }
}
