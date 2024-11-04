import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  List<bool> isSelected = [true, false];
  bool _isObscured = true;
  // Initial selection for "Assistant"
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Icon(
              Icons.school,
              size: 120,
              color: kLogoColor,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Attendance System',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ToggleButtons(
                color: kLogoColor,
                borderColor: Colors.blue,
                selectedBorderColor: Colors.blue,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                borderRadius: BorderRadius.circular(28),
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index; // Update selection state
                    }
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.help_center,
                          ),
                        ), // Assistant icon
                        Text('Assistant'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.school),
                        ), // Teacher icon
                        Text('Teacher'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomTextField(
              labelText: 'Email',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              obscureText: _isObscured,
              labelText: 'PassWord',
              iconButton: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Toggle password visibility
                  });
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomContainer(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Login',
            )
          ],
        ),
      ),
    );
  }
}
