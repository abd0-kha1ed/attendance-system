import 'package:attendance/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.labelText,
      this.iconButton,
      this.obscureText = false,
      this.enabled = true,
      this.onChanged,
      this.hintText,
      this.controller,
      this.onSaved,
      this.keyboardType});
  final String? labelText;
  final IconButton? iconButton;
  final bool obscureText;
  final bool enabled;
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onSaved: onSaved,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
        suffixIcon: iconButton,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kAppBarColor),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
