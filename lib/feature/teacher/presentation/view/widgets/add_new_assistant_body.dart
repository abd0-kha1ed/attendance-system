import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class AddNewAssistantBody extends StatelessWidget {
  AddNewAssistantBody({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formkey,
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(labelText: 'Name'),
            const SizedBox(
              height: 8,
            ),
            const CustomTextField(labelText: 'Phoen Number'),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('0/11')],
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextField(labelText: 'Email'),
            const SizedBox(
              height: 8,
            ),
            const CustomTextField(labelText: 'PassWord'),
            const SizedBox(
              height: 16,
            ),
            CustomContainer(
                onTap: () {
                  if (formkey.currentState!.validate()) {}
                },
                text: 'Add')
          ],
        ),
      ),
    );
  }
}
