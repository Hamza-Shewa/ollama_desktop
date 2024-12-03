import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(this.response, {super.key});
  final AiResponse response;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: response.isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: response.isUser
              ? context.theme.primaryColor
              : context.colorScheme.secondaryContainer,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(20),
            topEnd: const Radius.circular(20),
            bottomStart:
                response.isUser ? const Radius.circular(20) : Radius.zero,
            bottomEnd:
                response.isUser ? Radius.zero : const Radius.circular(20),
          ),
        ),
        child: Text(
          response.response,
          textDirection: response.response.contains(RegExp(r'[\u0600-\u06FF]'))
              ? TextDirection.rtl
              : TextDirection.ltr,
        ).marginAll(8),
      ),
    ).marginHorizontal(18);
  }
}
