import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';

class LanguageComponent extends StatelessWidget {
  const LanguageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Locale>(
      label: Text('language'.tr()),
      width: 500,
      dropdownMenuEntries: context.supportedLocales.map((e) {
        return DropdownMenuEntry(
          value: e,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              context.locale == e
                  ? context.theme.primaryColor
                  : context.colorScheme.secondaryContainer,
            ),
          ),
          label: e.toLanguageTag(),
        );
      }).toList(),
      initialSelection: context.locale,
      onSelected: (value) {
        if (value != null) {
          context.setLocale(value);
        }
      },
    );
  }
}
