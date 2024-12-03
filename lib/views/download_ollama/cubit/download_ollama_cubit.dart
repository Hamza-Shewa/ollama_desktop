import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'download_ollama_state.dart';
part 'download_ollama_cubit.freezed.dart';

class DownloadOllamaCubit extends Cubit<DownloadOllamaState> {
  DownloadOllamaCubit() : super(const DownloadOllamaState.initial());

  downloadOllama() async {
    final link = Uri.parse('https://ollama.com/download');
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {}
  }
}
