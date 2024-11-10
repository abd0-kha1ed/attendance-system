import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/add_new_student_body.dart';
import 'package:flutter/material.dart';

class AddNewStudentView extends StatelessWidget {
  const AddNewStudentView({super.key,required this.lectureModel});
  final LectureModel lectureModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Add New Student',
            style: TextStyle(color: Colors.black),
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
        body: AddNewStudentBody(
          lectureId: lectureModel.id,
        ));
  }
}
