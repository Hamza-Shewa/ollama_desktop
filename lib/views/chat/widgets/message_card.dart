import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/extensions.dart';
import 'package:ollama_desktop/structure/models/ai_response.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(this.response, {super.key});
  final AiResponse response;
  @override
  Widget build(BuildContext context) {
    final children = [
      CircleAvatar(
        backgroundColor: response.isUser
            ? context.theme.primaryColor
            : context.colorScheme.secondaryContainer,
        child: Text(
          response.isUser ? 'You' : 'AI',
          style: context.textTheme.titleMedium?.copyWith(
            color:
                !context.isDarkTheme && response.isUser ? Colors.white : null,
          ),
        ),
      ).marginOnly(
          left: response.isUser ? 8 : 0, right: response.isUser ? 0 : 8),
      Flexible(
        child: Container(
          decoration: BoxDecoration(
            color: response.isUser
                ? context.theme.primaryColor
                : context.colorScheme.secondaryContainer,
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(20)),
          ),
          child: SelectableText(
            response.response,
            style: context.textTheme.bodyMedium?.copyWith(
              color: !context.isDarkTheme && response.isUser
                  ? Colors.white
                  : context.isDarkTheme
                      ? Colors.white
                      : Colors.black,
            ),
            textDirection: RegExp(r'".*[\u0600-\u06FF].*"')
                        .hasMatch(response.response) &&
                    response.response.contains(RegExp(r'[A-Za-z]')) &&
                    !RegExp(r'[\u0600-\u06FF]').hasMatch(response.response[0])
                ? TextDirection.ltr
                : response.response.contains(RegExp(r'[\u0600-\u06FF]')) &&
                        RegExp(r'".*[A-Za-z].*"').hasMatch(response.response)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
          ).marginAll(8),
        ),
      ),
    ];
    return Align(
      alignment: response.isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: response.isUser ? children.reversed.toList() : children,
      ),
    ).marginHorizontal(18).marginBottom(8);
  }
}
