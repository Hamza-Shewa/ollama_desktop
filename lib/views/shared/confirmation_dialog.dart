import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';

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
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () async {
                      context.pop(result: false);
                    },
                    child: Text('cancel'.tr()),
                  ).marginEnd(8),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () async {
                      context.pop(result: true);
                    },
                    child: Text('confirm'.tr()),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
  return value;
}
