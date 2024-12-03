import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension Utilites on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
    //error snackbar
  }

  Future showBottomSheet(Widget child,
          {bool isDismissible = true, bool isScrollControlled = false}) =>
      showModalBottomSheet(
        context: this,
        useSafeArea: true,
        isDismissible: isDismissible,
        isScrollControlled: isScrollControlled,
        builder: (context) => child,
      );

  void pop({dynamic result}) => Navigator.pop(this, result);

  bool canPop() => Navigator.canPop(this);

  void popUntilRoute(String routeName) =>
      Navigator.popUntil(this, ModalRoute.withName(routeName));

  void popUntil(bool Function(Route<dynamic>) predicate) =>
      Navigator.popUntil(this, predicate);

  Future pushNamed(String routeName, {dynamic arguments}) async =>
      await Navigator.pushNamed(this, routeName, arguments: arguments);

  dynamic get arguments => ModalRoute.of(this)!.settings.arguments;

  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom != 0;

  void hideKeyboard() => FocusScope.of(this).unfocus();

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  Size get uSize => MediaQuery.sizeOf(this);

  Orientation get orientation => MediaQuery.orientationOf(this);

  void unfocus() => FocusScope.of(this).requestFocus(FocusNode());

  NavigatorState get navigator => Navigator.of(this);

  String get lanuageCode => Localizations.localeOf(this).languageCode;

  double get width => uSize.width;

  double get height => uSize.height;

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkTheme => theme.brightness == Brightness.dark;

  bool get isLandScape => orientation == Orientation.landscape;
}

isSmallDevice(Size size) {
  return size.height < 675;
}

log(dynamic message) {
  if (kDebugMode) {
    print('=======================');
    print('-----------------------');
    print(message);
    print('=======================');
    print(message.runtimeType);
    print('-----------------------');
    print('=======================');
  }
}

final _serverErrorController = StreamController<bool>.broadcast();

Stream<bool> get serverErrorStream => _serverErrorController.stream;

void disposeServerErrorStream() {
  _serverErrorController.close();
}

void handleServerError(bool hasError) {
  _serverErrorController.add(hasError);
}
