import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_container.dart';
import 'package:attendance/core/widgets/custom_snack_bar.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditExistingStudentBody extends StatefulWidget {
  const EditExistingStudentBody(
      {super.key, required this.studentModel, required this.lectureModel});
  final StudentModel studentModel;
  final LectureModel lectureModel;

  @override
  State<EditExistingStudentBody> createState() =>
      _EditExistingStudentBodyState();
}

class _EditExistingStudentBodyState extends State<EditExistingStudentBody> {
  final FirebaseServices firebaseServices = FirebaseServices();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController phoneParentController;
  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.studentModel.name);
    phoneController =
        TextEditingController(text: widget.studentModel.phoneNumber);
    phoneParentController =
        TextEditingController(text: widget.studentModel.parentPhoneNumber);
    codeController = TextEditingController(text: widget.studentModel.code);
    super.initState();
  }

  void savedChange() {
    setState(() {
      widget.studentModel.name = nameController.text;
      widget.studentModel.phoneNumber = phoneController.text;
      widget.studentModel.parentPhoneNumber = phoneParentController.text;
      widget.studentModel.code = codeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: codeController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: nameController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: phoneParentController,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomContainer(
                text: 'update',
                onTap: () async {
                  savedChange();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    isLoading = true;
                    setState(() {});
                    try {
                      await firebaseServices.updateStudent(
                          widget.studentModel.code,
                          widget.studentModel.name,
                          widget.studentModel.phoneNumber,
                          widget.studentModel.parentPhoneNumber,
                          widget.studentModel.studentId,
                          widget.lectureModel.id);
                      isLoading = false;
                      setState(() {});
                      GoRouter.of(context).pop();
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, 'Student was update successfully');
                    } on FirebaseException {
                      showSnackBar(
                          // ignore: use_build_context_synchronously
                          context,
                          'Oops there was an error, try later');
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
