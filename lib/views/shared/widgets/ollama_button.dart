import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/utilities.dart';

class OllamaButton extends StatelessWidget {
  const OllamaButton({
    this.onPressed,
    this.text,
    this.outLined = false,
    this.fullWidth = false,
    super.key,
  });
  final Function()? onPressed;
  final String? text;
  final bool outLined;
  final bool fullWidth;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: outLined ? Colors.transparent : context.theme.primaryColor,
      textColor: outLined ? context.theme.primaryColor : Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      elevation: outLined ? 0 : 2,
      height: 55,
      minWidth: fullWidth ? double.infinity : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: outLined ? context.theme.primaryColor : Colors.transparent,
        ),
      ),
      child: Text(text ?? ''),
    );
  }
}
