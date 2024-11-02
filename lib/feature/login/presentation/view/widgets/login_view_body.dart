import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          FontAwesomeIcons.school,
          size: 50,
        ),
        CustomTextField(
          labelText: 'email',
        )
      ],
    );
  }
}
