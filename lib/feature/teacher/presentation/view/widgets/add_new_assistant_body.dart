import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewAssistantBody extends StatefulWidget {
  const AddNewAssistantBody({super.key});

  @override
  State<AddNewAssistantBody> createState() => _AddNewAssistantBodyState();
}

class _AddNewAssistantBodyState extends State<AddNewAssistantBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final FirebaseServices firebaseServices = FirebaseServices();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, password, phone, email;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formkey,
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              labelText: 'Name',
              controller: nameController,
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              onSaved: (value) {
                phone = value;
              },
              labelText: 'Phoen Number',
              controller: numberController,
            ),
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
            CustomTextField(
              onSaved: (value) {
                email = value;
              },
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              onSaved: (value) {
                password = value;
              },
              labelText: 'PassWord',
              controller: passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomContainer(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }

                  // final name = nameController.text;
                  // final phoneNumber = numberController.text;
                  // final email = emailController.text;
                  // final password = passwordController.text;

                  try {
                    await firebaseServices.addNewAssistant(
                        name!, phone!, email!, password!);
                  } on FirebaseException catch (e) {
                    print('Error adding assistant: ${e.message}');
                  }
                },
                text: 'Add')
          ],
        ),
      ),
    );
  }
}
