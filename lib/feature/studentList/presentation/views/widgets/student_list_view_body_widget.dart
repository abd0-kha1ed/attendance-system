import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentListViewBodyWidget extends StatelessWidget {
  const StudentListViewBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(child: CustomStudentNameId()),
            const SizedBox(
              height: 30,
            ),
            CustomIconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kEditExistingStudent);
              },
              icon: const Icon(
                Icons.edit,
                color: kAppBarColor,
              ),
            ),
          ],
        ),
        const WhatsPhone(
          phoneNumber: '',
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
