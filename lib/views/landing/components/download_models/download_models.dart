import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/landing/components/download_models/cubit/download_models_cubit.dart';

class DownloadModelsView extends StatelessWidget {
  const DownloadModelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadModelsCubit(),
      child: BlocBuilder<DownloadModelsCubit, DownloadModelsState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('Download Models'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Download models
                  },
                  child: const Text('Download'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
