// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleContainer extends StatelessWidget {
  double? width;
  Color? color;
  Widget? centerChild;
  VoidCallback? onTap;
  CircleContainer({
    Key? key,
    this.width,
    this.color,
    this.centerChild,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(width ?? 20),
      child: Container(
        width: width ?? 40,
        height: width ?? 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.white,
        ),
        child: Center(
          child: centerChild,
        ),
      ),
    );
  }
}
