import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';
import 'package:ollama_desktop/views/history/history.dart';
import 'package:ollama_desktop/views/home/home_view.dart';
import 'package:ollama_desktop/views/settings/settings_view.dart';
import 'package:ollama_desktop/views/shared/error_view.dart';

class OllamaRouter {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: setting,
        );
      case settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsView(),
          settings: setting,
        );
      case history:
        return MaterialPageRoute(
          builder: (_) => const HistoryView(),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorView(),
          settings: setting,
        );
    }
  }
}
