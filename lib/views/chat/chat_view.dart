import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/routes/app_routes.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/chat/widgets/message_card.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OllamaAppBar(
        title: 'Ollama Chat'.tr(),
        leading: IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            context.pushNamed(history);
          },
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final controller = context.read<ChatCubit>();

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.aiResponses.length +
                      (state.maybeWhen(loading: () => 1, orElse: () => 0)),
                  itemBuilder: (context, index) {
                    if (index < controller.aiResponses.length) {
                      final item = controller.aiResponses[index];
                      return MessageCard(item);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: KeyboardListener(
                      onKeyEvent: controller.onKeyEvent,
                      focusNode: controller.focusNode,
                      child: TextField(
                        controller: controller.messageController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 15,
                        decoration: InputDecoration(
                          hintText: 'Type a message'.tr(),
                          border: const OutlineInputBorder(),
                        ),
                      ).marginEnd(8),
                    ),
                  ),
                  MaterialButton(
                    height: 55,
                    onPressed: controller.sendMessage,
                    child: Text('Send Message'.tr()),
                  ),
                ],
              ).marginBottom(20).marginTop(8),
            ],
          ).marginHorizontal(18);
        },
      ),
    );
  }
}
