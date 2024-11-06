import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class FloatingActionbuttonWidget extends StatelessWidget {
  const FloatingActionbuttonWidget({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kLogoColor,
      child: Center(
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
