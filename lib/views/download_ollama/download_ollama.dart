import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/margins.dart';
import 'package:ollama_desktop/views/download_ollama/cubit/download_ollama_cubit.dart';
import 'package:ollama_desktop/views/home/cubit/home_cubit.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_app_bar.dart';

class DownloadOllama extends StatelessWidget {
  const DownloadOllama({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeCubit>();
    return Scaffold(
      appBar: const OllamaAppBar(
        title: 'Download Ollama',
        showActions: false,
      ),
      body: BlocProvider(
        create: (context) => DownloadOllamaCubit(),
        child: BlocBuilder<DownloadOllamaCubit, DownloadOllamaState>(
          builder: (context, state) {
            final controller = context.read<DownloadOllamaCubit>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      "Ops! Seems like you don't have Ollama installed."),
                  ElevatedButton(
                    onPressed: homeController.init,
                    child: const Text('Retry'),
                  ).marginVertical(20),
                  ElevatedButton(
                    onPressed: controller.downloadOllama,
                    child: const Text('Download Ollama'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
