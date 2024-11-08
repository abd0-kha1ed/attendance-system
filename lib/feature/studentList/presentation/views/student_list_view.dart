import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_body.dart';
import 'package:flutter/material.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Students List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kAppBarColor,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body:  StudentListViewBody(),
    );
  }
}
