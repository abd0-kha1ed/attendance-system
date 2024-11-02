import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.school,
          size: 50,
        ),
        CustomTextField(
          labelText: 'email',
        )
      ],
    );
  }
}
