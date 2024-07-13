import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
AppBar AppAppBar(
  BuildContext context, {
  String? title,
  Widget? titleWidget,
  Widget? leading,
  List<Widget>? actions,
  VoidCallback? onClickBack,
  Color? backgroundColor,
  Color? forgroundColor,
  bool enableBackButton = true,
  Brightness? statusBarBrightness = Brightness.light,
}) =>
    AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: forgroundColor,
      title: titleWidget ?? (title != null ? Text(title) : null),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness,
      ),
      leading: leading ??
          (enableBackButton
              ? Center(
                  child: IconButton(
                    onPressed: onClickBack ??
                        () {
                          Navigator.pop(context);
                        },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                )
              : null),
      actions: actions,
    );
