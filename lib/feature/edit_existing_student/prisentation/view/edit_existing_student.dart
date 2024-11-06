import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/edit_existing_student/prisentation/view/widgets/edit_existing_student_body.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:flutter/material.dart';

class EditExistingStudent extends StatelessWidget {
  const EditExistingStudent({super.key, required this.studentModel});
  final AddNewStudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Existing Student',
          style: TextStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
      ),
      body: EditExistingStudentBody(
        studentModel: studentModel,
      ),
    );
  }
}
