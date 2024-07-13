// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double radius;
  final String image;
  const CircleImage({
    Key? key,
    this.radius = 48,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(image),
    );
  }
}
