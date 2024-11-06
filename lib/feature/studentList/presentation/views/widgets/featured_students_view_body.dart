import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/cusomt_add_new_button_widget.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';

import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedStudentsViewBody extends StatelessWidget {
  const FeaturedStudentsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CustomSearchStudentList(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: StudentListViewWidget()),
        ],
      ),
    );
  }
}
