import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ollama_desktop/views/chat/cubit/chat_cubit.dart';
import 'package:ollama_desktop/views/chat/widgets/message_card.dart';
import 'package:ollama_desktop/views/shared/app_bar.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OllamaAppBar(
        title: 'Ollama Chat',
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final controller = context.read<ChatCubit>();
            return Center(
              child: Column(
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
                          return Center(
                              child: const CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  TextField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                  MaterialButton(
                    onPressed: controller.sendMessage,
                    child: const Text('Send Message'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
