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
      },
      decoration: InputDecoration(
        suffixIcon: iconButton,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
