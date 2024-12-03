import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/structure/extensions/margins.dart';
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
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final controller = context.read<ChatCubit>();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.aiModels.length +
                        (state.maybeWhen(loading: () => 1, orElse: () => 0)),
                    itemBuilder: (context, index) {
                      if (index < controller.aiModels.length) {
                        final item = controller.aiModels[index];
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
                      child: TextField(
                        controller: controller.messageController,
                        onSubmitted: (v) {
                          controller.sendMessage();
                          controller.messageController.clear();
                        },
                        decoration: InputDecoration(
                          hintText: 'Type a message'.tr(),
                          border: const OutlineInputBorder(),
                        ),
                      ).marginEnd(8),
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
      ),
    );
  }
}
