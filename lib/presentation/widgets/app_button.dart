// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/presentation/widgets/app_loading_indicator.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? width;
  final double? height;
  final bool disable;
  final Color? backgroundColor;
  final Color? forgroundColor;
  final TextStyle? style;
  final bool isLoading;
  final bool enableShadow;
  final double? borderRadius;
  final Widget? extraWidget;
  final EdgeInsetsGeometry? padding;
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 56,
    this.disable = false,
    this.backgroundColor,
    this.forgroundColor,
    this.style,
    this.isLoading = false,
    this.enableShadow = true,
    this.borderRadius,
    this.extraWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          backgroundColor: MaterialStateProperty.all(
              disable ? AppColors.lightGrey : backgroundColor),
          foregroundColor: MaterialStateProperty.all(forgroundColor),
          shape: borderRadius == null
              ? null
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                  ),
                ),
          shadowColor: enableShadow
              ? null
              : MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: disable || isLoading ? null : onPressed,
        child: !isLoading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (extraWidget != null) ...[
                    extraWidget!,
                    const SizedBox(width: 4)
                  ],
                  Text(
                    title,
                    style: style,
                  ),
                ],
              )
            : AppLoadingIndicator(
                color: forgroundColor ?? Colors.white,
              ),
      ),
    );
  }
}
