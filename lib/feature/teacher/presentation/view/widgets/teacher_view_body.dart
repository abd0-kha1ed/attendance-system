import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/cusomt_add_new_button_widget.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/teacher/presentation/view/widgets/teacher_assisstant_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: Column(
        children: [
          const Expanded(
            child: TeacherAssistantListView(),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: CustomAddNewbuttonWidget(
                onTap: () {
                  GoRouter.of(context).push(AppRouters.kAddNewAssistant);
                },
                text: 'Add New Assistant',
                icons: Icons.person,
              ))
        ],
      ),
    );
  }
}
