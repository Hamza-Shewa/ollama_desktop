import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/utilities.dart';

class OllamaButton extends StatelessWidget {
  const OllamaButton({
    this.onPressed,
    this.text,
    this.outLined = false,
    this.fullWidth = false,
    this.suffex,
    this.height = 55,
    super.key,
  });
  final Function()? onPressed;
  final String? text;
  final bool outLined;
  final bool fullWidth;
  final Widget? suffex;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: outLined ? Colors.transparent : context.theme.primaryColor,
      textColor: outLined ? context.theme.primaryColor : Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      hoverElevation: outLined ? 0 : 2,
      highlightElevation: outLined ? 0 : 2,
      elevation: outLined ? 0 : 2,
      height: height,
      minWidth: fullWidth ? double.infinity : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: outLined ? context.theme.primaryColor : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? '',
            style: context.textTheme.titleSmall!.copyWith(
              color: outLined ? context.theme.primaryColor : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (suffex != null) suffex!,
        ],
      ),
    );
  }
}
