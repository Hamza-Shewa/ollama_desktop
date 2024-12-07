import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/chat/widgets/message_card.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_app_bar.dart';
import 'package:ollama_desktop/views/shared/confirmation_dialog.dart';
import 'package:ollama_desktop/views/shared/widgets/ollama_button.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit()..setChat(context.arguments),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final controller = context.read<ChatCubit>();
          return Scaffold(
            appBar: OllamaAppBar(
              title: 'Ollama Chat'.tr(),
              leading: BackButton(
                onPressed: () async {
                  if (controller.aiResponses.isNotEmpty) {
                    await showConfirmation(
                      context,
                      'Save chat'.tr(),
                      'Do you want to save the current chat?'.tr(),
                    ).then((v) {
                      if (v) {
                        controller.saveChat();
                      }
                    });
                  }
                  context.pop();
                },
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    controller: controller.scrollController,
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
                        onKeyEvent: (event) async {
                          await controller.onKeyEvent(event);
                        },
                        focusNode: FocusNode(),
                        child: TextField(
                          controller: controller.messageController,
                          keyboardType: TextInputType.multiline,
                          focusNode: controller.focusNode,
                          minLines: 1,
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: 'Type a message'.tr(),
                            hintStyle: context.theme.textTheme.bodySmall,
                            border: const OutlineInputBorder(),
                          ),
                        ).marginEnd(8),
                      ),
                    ),
                    OllamaButton(
                      onPressed: controller.sendMessage,
                      text: 'Send Message'.tr(),
                      height: 60,
                      suffex: const Icon(
                        Icons.send,
                        size: 20,
                      ).marginStart(16),
                    ),
                  ],
                ).marginBottom(20).marginTop(8),
              ],
            ).marginHorizontal(18),
          );
        },
      ),
    );
  }
}
