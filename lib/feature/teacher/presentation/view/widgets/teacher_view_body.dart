import 'package:attendance/constant.dart';

import 'package:attendance/core/widgets/custom_lift_arrow.dart';

import 'package:attendance/feature/teacher/presentation/view/widgets/add_new_assistant_widget.dart';
import 'package:attendance/feature/teacher/presentation/view/widgets/teacher_assisstant_list_view.dart';
import 'package:flutter/material.dart';

class TeacherViewBody extends StatelessWidget {
  const TeacherViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: const Text(
          'My Assistants',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: TeacherAssistantListView(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: AddNewAssisstantWidget(),
          )
        ],
      ),
    );
  }
}
