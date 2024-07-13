// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:reddit_task/core/resources/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double radius;
  const AppLoadingIndicator({
    Key? key,
    this.color,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppColors.primary,
        radius: radius,
      ),
    );
  }
}
