import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/chat/widgets/message_card.dart';
import 'package:ollama_desktop/views/shared/widgets/app_bar.dart';
import 'package:ollama_desktop/views/shared/confirmation_dialog.dart';

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
            ).marginHorizontal(18),
          );
        },
      ),
    );
  }
}
