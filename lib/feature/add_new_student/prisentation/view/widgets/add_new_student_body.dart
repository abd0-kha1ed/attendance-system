import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class AddNewStudentBody extends StatefulWidget {
  const AddNewStudentBody({super.key});

  @override
  State<AddNewStudentBody> createState() => _AddNewStudentBodyState();
}

class _AddNewStudentBodyState extends State<AddNewStudentBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formkey,
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
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
