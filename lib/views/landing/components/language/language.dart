import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';

class LanguageComponent extends StatelessWidget {
  const LanguageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> languages = ["English", "العربية"];
    return DropdownMenu<Locale>(
      label: Text('language'.tr()),
      width: 500,
      dropdownMenuEntries:
          List.generate(context.supportedLocales.length, (index) {
        final language = context.supportedLocales[index];
        return DropdownMenuEntry(
          value: language,
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              context.textTheme.titleSmall,
            ),
          ),
          label: languages[index],
        );
      }),
      initialSelection: context.locale,
      onSelected: (value) {
        if (value != null) {
          context.setLocale(value);
        }
      },
    );
  }
}
