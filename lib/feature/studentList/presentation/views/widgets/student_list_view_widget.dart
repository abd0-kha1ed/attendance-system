import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';

class StudentListViewWidget extends StatelessWidget {
  const StudentListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const Column(
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
