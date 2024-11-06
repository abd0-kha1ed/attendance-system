import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewFeatureBody extends StatefulWidget {
  const AddNewFeatureBody({
    super.key,
  });

  @override
  State<AddNewFeatureBody> createState() => _AddNewFeatureBodyState();
}

class _AddNewFeatureBodyState extends State<AddNewFeatureBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? code, name;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isLoading = false;

  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    final nameController = TextEditingController();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
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
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // await firebaseServices.addStudentFeature(name!, code!,);
                  isLoading = true;
                  setState(() {});
                  try {
                    isLoading = false;
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    showSnackBar(context, 'Student was add successfully');
                  } on FirebaseException {
                    showSnackBar(
                        // ignore: use_build_context_synchronously
                        context,
                        'Oops there was an error, try later');
                  }
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
