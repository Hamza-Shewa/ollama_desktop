import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/settings/components/themes/cubit/themes_cubit.dart';

class ThemeComponent extends StatelessWidget {
  const ThemeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemesCubit(),
      child: BlocBuilder<ThemesCubit, ThemesState>(
        builder: (context, state) {
          final controller = context.read<ThemesCubit>();
          return SwitchListTile(
            value: controller.getTheme() == 'light',
            onChanged: (bool value) {
              controller.updateTheme(value ? 'light' : 'dark');
            },
            title: Text(controller.getTheme().toUpperCase()),
          );
        },
      ),
    );
  }
}
