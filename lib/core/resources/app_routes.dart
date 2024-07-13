import 'package:flutter/cupertino.dart';

/// static function to navigate with on PageRoute Type.
/// to change it any time you need.

class AppRouter {
  static PageRoute<T> getPageRoute<T>(Widget pageWidget) => CupertinoPageRoute(
        builder: (context) => pageWidget,
      );

  static Future<T?> push<T>(BuildContext context, Widget child) =>
      Navigator.push(context, getPageRoute<T>(child));

  static Future<T?> pushReplacement<T>(BuildContext context, Widget child) =>
      Navigator.pushReplacement(context, getPageRoute<T>(child));

  static Future<T?> pushAndRemoveUntil<T>(BuildContext context, Widget child,
          bool Function(Route<dynamic>) predicate) =>
      Navigator.pushAndRemoveUntil(context, getPageRoute<T>(child), predicate);
}
