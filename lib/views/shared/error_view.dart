import 'package:flutter/material.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OllamaAppBar(),
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
