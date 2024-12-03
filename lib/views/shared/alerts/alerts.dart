import 'package:flutter/material.dart';
import 'package:ollama_desktop/views/shared/alerts/ui.dart';

class OllamaAlerts {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void hideSnackBar() {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  static void successSnackBar(String message, {SnackBarAction? action}) {
    rootScaffoldMessengerKey.currentState?.removeCurrentSnackBar();
    rootScaffoldMessengerKey.currentState
        ?.showSnackBar(Ui.successSnack(message, action: action));
  }

  static void errorSnackBar(
    String message, {
    SnackBarAction? action,
    Duration? duration,
  }) {
    rootScaffoldMessengerKey.currentState?.removeCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      Ui.errorSnack(
        message,
        action: action,
        duration: duration,
      ),
    );
  }

  static void warningSnackBar(
    String message, {
    SnackBarAction? action,
    Duration? duration,
  }) {
    rootScaffoldMessengerKey.currentState?.removeCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      Ui.warningSnack(
        message,
        action: action,
        duration: duration,
      ),
    );
  }
}
