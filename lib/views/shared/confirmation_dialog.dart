import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_button.dart';

Future<bool> showConfirmation(
  BuildContext context,
  String title,
  String content,
) async {
  bool value = await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: OllamaButton(
                    onPressed: () async {
                      context.pop(result: false);
                    },
                    outLined: true,
                    text: 'cancel'.tr(),
                  ).marginEnd(8),
                ),
                Expanded(
                  child: OllamaButton(
                    onPressed: () async {
                      context.pop(result: true);
                    },
                    text: 'confirm'.tr(),
                  ),
                ),
              ],
            ).marginTop(12),
          ],
        ),
      );
    },
  );
  return value;
}
