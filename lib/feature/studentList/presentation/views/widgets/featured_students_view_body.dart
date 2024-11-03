import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';

class FeaturedStudentsViewBody extends StatelessWidget {
  const FeaturedStudentsViewBody({super.key});
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
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return const Column(
              children: [
                CustomStudintNameId(),
                SizedBox(
                  height: 6,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }))
        ],
      ),
    );
  }
}
