import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/core/widgets/floating_action_button_widget.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});
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
      body: const StudentListViewBody(),
      floatingActionButton: FloatingActionbuttonWidget(
        onPressed: () {
          GoRouter.of(context).push(AppRouters.kAddnewStudent);
        },
      ),
    );
  }
}
