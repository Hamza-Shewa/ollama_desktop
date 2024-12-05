import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';
import 'package:ollama_desktop/views/settings/components/language/language.dart';
import 'package:ollama_desktop/views/settings/components/models/models.dart';
import 'package:ollama_desktop/views/settings/components/themes/themes.dart';
import 'package:ollama_desktop/views/shared/widgets/app_bar.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_button.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OllamaAppBar(
        title: 'Ollama Desktop',
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Landing Page',
              ).marginBottom(20),
              const LanguageComponent(),
              const ThemeComponent().marginVertical(20),
              const ModelsComponent(),
              Row(
                children: [
                  Expanded(
                    child: OllamaButton(
                      text: 'Go to History'.tr(),
                      outLined: true,
                      fullWidth: true,
                      onPressed: () {
                        context.pushNamed(history);
                      },
                    ).marginEnd(20),
                  ),
                  Expanded(
                    child: OllamaButton(
                      text: 'Go to Chat'.tr(),
                      onPressed: () {
                        context.pushNamed(chat);
                      },
                      fullWidth: true,
                    ),
                  ),
                ],
              ).marginVertical(20),
            ],
          ),
        ),
      ),
    );
  }
}