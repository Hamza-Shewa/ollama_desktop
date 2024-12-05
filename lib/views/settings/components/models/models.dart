import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/settings/components/models/cubit/models_cubit.dart';
import 'package:ollama_desktop/views/shared/confirmation_dialog.dart';

class ModelsComponent extends StatelessWidget {
  const ModelsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModelsCubit(),
      child: BlocBuilder<ModelsCubit, ModelsState>(
        builder: (context, state) {
          final controller = context.read<ModelsCubit>();
          return state.when(
            initial: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (models) {
              return DropdownMenu<String>(
                dropdownMenuEntries: models.map((model) {
                  return DropdownMenuEntry(
                    value: model.model,
                    label: model.name,
                  );
                }).toList(),
                onSelected: (value) async {
                  if (value != null) {
                    controller.setModel(value);
                  }
                },
                initialSelection: controller.getModel(),
              );
            },
            error: (e) {
              return const Center(
                child: Text('Error'),
              );
            },
          );
        },
      ),
    );
  }
}
