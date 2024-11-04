import 'package:attendance/core/widgets/cusomt_add_new_button_widget.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';

import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_body_widget.dart';
import 'package:flutter/material.dart';

class StudentListViewBody extends StatelessWidget {
  const StudentListViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomSearchStudentList(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return const StudentListviewBodyWidget();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomAddNewbuttonWidget(
              text: "add New Student",
              icons: Icons.person,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
