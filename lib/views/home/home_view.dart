import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/download_ollama/download_ollama.dart';
import 'package:ollama_desktop/views/home/cubit/home_cubit.dart';
import 'package:ollama_desktop/views/landing/landing_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
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
            loaded: () {
              return const LandingView();
            },
            error: (e) {
              return const DownloadOllama();
            },
          );
        },
      ),
    );
  }
}
