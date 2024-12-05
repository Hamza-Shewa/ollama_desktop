import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/models/ai_model.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';
import 'package:ollama_desktop/structure/models/chat.dart';
import 'package:ollama_desktop/views/shared/alerts/alerts.dart';
import 'package:ollama_desktop/structure/global/dio_helper.dart';
import 'package:ollama_desktop/structure/global/get_it.dart';
import 'package:ollama_desktop/structure/routes/router.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/shared/themes/dark_theme.dart';
import 'package:ollama_desktop/views/shared/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await DioHelper.initConnection();
  await initHive();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      useOnlyLangCode: true,
      saveLocale: true,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

Future initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AiResponseAdapter());
  Hive.registerAdapter(AiModelAdapter());
  Hive.registerAdapter(ChatAdapter());
  await Hive.openBox('settings');
  await Hive.openBox('chats');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, child) {
          return MaterialApp(
            title: 'Ollama Desktop',
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: box.get('theme', defaultValue: 'light') == 'light'
                ? ThemeMode.light
                : ThemeMode.dark,
            scaffoldMessengerKey: OllamaAlerts.rootScaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: OllamaRouter().generateRoute,
          );
        });
  }
}
