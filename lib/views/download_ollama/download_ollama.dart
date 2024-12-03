import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/download_ollama/cubit/download_ollama_cubit.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class DownloadOllama extends StatelessWidget {
  const DownloadOllama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OllamaAppBar(
        title: 'Download Ollama',
        showActions: false,
      ),
      body: BlocProvider(
        create: (context) => DownloadOllamaCubit(),
        child: BlocBuilder<DownloadOllamaCubit, DownloadOllamaState>(
          builder: (context, state) {
            final controller = context.read<DownloadOllamaCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Ops! Seems like you don't have Ollama installed."),
                Text("Download it now!"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Download Ollama'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
