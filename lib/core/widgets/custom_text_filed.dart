import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.iconButton,
      this.obscureText = false});
  final String labelText;
  final IconButton? iconButton;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: iconButton,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kAppBarColor),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
