import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/models/chat.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ChatCubit>();
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
              final Chat chat = box.getAt(index);
              return ListTile(
                title: Text(chat.model),
                onTap: () {
                  controller.setChat(chat);
                  context.pop();
                },
                subtitle: Text(chat.responses.isEmpty
                    ? 'No Response'
                    : chat.responses.last.response),
              );
            },
          );
        },
      ),
    );
  }
}
