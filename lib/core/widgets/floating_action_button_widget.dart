import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kLogoColor,
      child: const Center(
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
