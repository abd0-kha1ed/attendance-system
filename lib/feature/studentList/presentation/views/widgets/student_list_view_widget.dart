import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';

class StudentListViewWidget extends StatelessWidget {
  const StudentListViewWidget({super.key, required this.addNewStudentModel});
  final StudentModel addNewStudentModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomStudentNameId(
                addNewStudentModel: addNewStudentModel,
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        });
  }
}
