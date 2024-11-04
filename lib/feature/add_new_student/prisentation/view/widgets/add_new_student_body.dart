import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class AddNewStudentBody extends StatelessWidget {
  AddNewStudentBody({super.key});
  final GlobalKey<FormState> keyform = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: keyform,
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hintText: 'Student Code',
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(
              hintText: 'Name',
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(
              hintText: 'Phone Number',
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('0/11')],
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomTextField(
              hintText: 'Parent Phone Number',
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('0/11')],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomContainer(
              text: 'Add',
              onTap: () {
                if (keyform.currentState!.validate()) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
