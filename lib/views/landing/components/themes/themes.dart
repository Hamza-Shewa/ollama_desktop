import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';

class ThemeComponent extends StatelessWidget {
  const ThemeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(keys: ['theme']),
        builder: (context, box, widget) {
          String theme = box.get('theme', defaultValue: 'light');
          return Row(
            children: [
              Expanded(
                child: Text(
                  theme.tr(),
                  style: context.theme.textTheme.bodyLarge,
                ).marginEnd(20),
              ),
              Switch(
                value: theme == 'light',
                onChanged: (bool value) {
                  box.put('theme', value ? 'light' : 'dark');
                },
              ),
            ],
          );
        });
  }
}
