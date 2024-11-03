import 'package:attendance/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLiftArrow extends StatelessWidget {
  const CustomLiftArrow({
    super.key,
    required this.colorIcon,
    required this.backgroundColor,
  });
  final Color colorIcon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Image.asset(
        Assets.leftArrow,
        color: colorIcon,
        scale: 0.7,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
      ),
    );
  }
}
