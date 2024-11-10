import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/edit_existing_student/presentation/view/widgets/edit_existing_student_body.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:flutter/material.dart';

class EditExistingStudent extends StatelessWidget {
  const EditExistingStudent({super.key, required this.studentModel, required this.lectureModel});
  final StudentModel studentModel;
  final LectureModel lectureModel;
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
        lectureModel: lectureModel,
        studentModel: studentModel,
      ),
    );
  }
}
