import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';
import 'package:ollama_desktop/views/settings/components/language/language.dart';
import 'package:ollama_desktop/views/settings/components/models/models.dart';
import 'package:ollama_desktop/views/settings/components/themes/themes.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OllamaAppBar(
        title: 'Ollama Desktop',
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Landing Page'),
            const LanguageComponent(),
            const ThemeComponent().marginVertical(20),
            const ModelsComponent(),
            MaterialButton(
              child: const Text('Go to Chat'),
              onPressed: () {
                context.pushNamed(chat);
              },
            )
          ],
        ),
      ),
    );
  }
}
