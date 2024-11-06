import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class AddNewFeatureBody extends StatefulWidget {
  const AddNewFeatureBody({
    super.key,
  });

  @override
  State<AddNewFeatureBody> createState() => _AddNewFeatureBodyState();
}

class _AddNewFeatureBodyState extends State<AddNewFeatureBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? code, name, phoneNumber, parentPhoneNumber;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: ListView(children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            controller: codeController,
            hintText: 'Student Code',
            onSaved: (value) {
              code = value;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Name',
            onSaved: (value) {
              name = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomContainer(
            text: 'add new student',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
            },
          ),
        ]),
      ),
    );
  }
}
