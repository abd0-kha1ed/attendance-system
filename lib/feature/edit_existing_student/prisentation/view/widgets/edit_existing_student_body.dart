import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class EditExistingStudentbody extends StatelessWidget {
  EditExistingStudentbody({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formkey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              labelText: '304',
              enabled: false,
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(hintText: "احمد مختار خطاب"),
            const CustomTextField(hintText: "احمد مختار خطاب"),
            const CustomTextField(hintText: "احمد مختار خطاب"),
            const SizedBox(
              height: 16,
            ),
            CustomContainer(
              text: 'update',
              onTap: () {
                if (formkey.currentState!.validate()) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
