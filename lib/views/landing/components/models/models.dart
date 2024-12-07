import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/views/landing/components/models/cubit/models_cubit.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_button.dart';

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
              return Column(
                children: [
                  Form(
                    key: controller.formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid URL'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffix: IconButton(
                                onPressed: () {
                                  controller
                                      .setApiUrl('http://localhost:11434/api/');
                                },
                                icon: const Icon(Icons.restore),
                              ),
                            ),
                            controller: controller.apiController,
                          ),
                        ),
                        OllamaButton(
                          text: 'Update API URL'.tr(),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller
                                  .setApiUrl(controller.apiController.text);
                            }
                          },
                        ).marginStart(20),
                      ],
                    ).marginVertical(20),
                  ),
                  DropdownMenu<String>(
                    width: 500,
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
                  ),
                ],
              );
            },
            error: (e) {
              return Center(
                child: Text('Error'.tr()),
              );
            },
          );
        },
      ),
    );
  }
}
