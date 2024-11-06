import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:attendance/feature/teacher/data/models/add_assistant_model.dart';
import 'package:flutter/material.dart';

class StudentListViewWidget extends StatelessWidget {
  const StudentListViewWidget({
    super.key,
  });
  //  AddNewStudentModel addNewStudentModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomStudentNameId(
                name: '',
                code: '',
              ),
              SizedBox(
                height: 6,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
            ],
          );
        });
  }
}
