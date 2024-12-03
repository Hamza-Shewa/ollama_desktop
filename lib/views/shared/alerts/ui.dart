import 'package:flutter/material.dart';
import 'package:ollama_desktop/structure/extensions/margins.dart';

class Ui {
  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static SnackBar successSnack(String message, {SnackBarAction? action}) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            color: const Color(0xff4FB59E),
            width: 2,
            height: 40,
          ),
          const Icon(Icons.done, color: Color(0xff4FB59E)).marginHorizontal(8),
          Expanded(
            child: Text(
              message,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff4FB59E),
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xffEEF8F6),
      duration: const Duration(seconds: 2),
      action: action,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static SnackBar errorSnack(
    String message, {
    SnackBarAction? action,
    Duration? duration,
  }) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            color: const Color(0xffE4003B),
            width: 2,
            height: 40,
          ),
          const Icon(Icons.error, color: Color(0xffE4003B)).marginHorizontal(8),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 4,
              style: const TextStyle(
                color: Color(0xffE4003B),
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xffFDF2F5),
      duration: duration ?? const Duration(seconds: 2),
      action: action,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static SnackBar warningSnack(
    String message, {
    SnackBarAction? action,
    Duration? duration,
  }) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            color: const Color(0xffFFC107),
            width: 2,
            height: 40,
          ),
          const Icon(Icons.warning, color: Color(0xffFFC107))
              .marginHorizontal(8),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 4,
              style: const TextStyle(
                color: Color(0xffFFC107),
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xffFDF2F5),
      duration: duration ?? const Duration(seconds: 2),
      action: action,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
