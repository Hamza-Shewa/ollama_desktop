import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/models/chat.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';
import 'package:ollama_desktop/views/shared/widgets/app_bar.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OllamaAppBar(
        title: 'History'.tr(),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('chats').listenable(),
        builder: (context, box, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final Chat item = box.getAt(index);
              return ListTile(
                title: Text(item.model),
                onTap: () {
                  context.pushNamed(chat, arguments: item);
                },
                subtitle: Text(item.responses.isEmpty
                    ? 'No Response'.tr()
                    : item.responses.last.response),
              );
            },
          );
        },
      ),
    );
  }
}
