import 'package:flutter/material.dart';
import 'package:reddit_task/app/app.dart';
import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/core/resources/app_strings.dart';
import 'package:reddit_task/presentation/widgets/app_button.dart';
import 'package:reddit_task/presentation/widgets/app_loading_indicator.dart';

class DialogsManager {
  static Future<T> showAppDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? backGroundColor,
    bool barrierDismissible = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: backGroundColor,
      builder: (_) => AlertDialog(
        title: child,
      ),
    );
  }

  static Future<dynamic> showAlertDialog(
    BuildContext context,
    String message, {
    Function()? onTapOk,
    bool barrierDismissible = true,
    String? okText,
    bool showRightSighn = false,
  }) async {
    return await showAppModelSheet(
      context,
      barrierDismissible: barrierDismissible,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (showRightSighn) ...[
              const SizedBox(height: 32),
              const Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 80,
              ),
            ],
            const SizedBox(height: 32),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              title: okText ?? AppStrings.ok,
              onPressed: () {
                Navigator.pop(context);
                if (onTapOk != null) {
                  onTapOk();
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  static Future<bool?> showOptionalDialog(
    BuildContext context,
    String containt, {
    String? okText,
    String? cancelText,
    Color? okColor,
    Color? okTextColor,
    Color? cancelColor,
    VoidCallback? onTapOk,
    VoidCallback? onTapCancel,
    bool barrierDismissible = true,
  }) async {
    return await showAppModelSheet<bool>(
      context,
      barrierDismissible: barrierDismissible,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              containt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              title: okText ?? AppStrings.ok,
              onPressed: () {
                Navigator.pop(context, true);
                if (onTapOk != null) {
                  onTapOk();
                }
              },
              // backgroundColor: okColor,
              style: TextStyle(
                color: okTextColor,
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              title: cancelText ?? AppStrings.Cancel,
              onPressed: () {
                Navigator.pop(context, false);
                if (onTapCancel != null) {
                  onTapCancel();
                }
              },
              forgroundColor: AppColors.primary,
              backgroundColor: cancelColor ?? Colors.white,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  static Future<void> showLoadingDialog(
      // BuildContext context,
      {
    bool loadingDefultIndecator = true,
  }) async {
    await showDialog(
      context: appKey.currentContext!,
      barrierDismissible: false,
      builder: (_) => const Center(child: AppLoadingIndicator()),
    );
  }

  static Future<T?> showAppModelSheet<T>(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: barrierDismissible,
      backgroundColor: AppColors.ligtBlack,
      enableDrag: barrierDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusScope.of(_).unfocus();
        },
        child: Wrap(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
