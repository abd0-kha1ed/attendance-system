import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/app_routers.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:attendance/feature/edit_existing_student/prisentation/view/edit_existing_student.dart';
import 'package:attendance/feature/edit_lecture/presentation/view/edit_lecture_view.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentListViewBodyWidget extends StatelessWidget {
  const StudentListViewBodyWidget({
    super.key,
    required this.studentModel,
  });
  final AddNewStudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: CustomStudentNameId(
                name: studentModel.name,
                code: studentModel.code,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return EditExistingStudent(
                      studentModel: studentModel,
                    );
                  }),
                );
                // GoRouter.of(context).push(AppRouters.kEditExistingStudent);
              },
              icon: const Icon(
                Icons.edit,
                color: kAppBarColor,
              ),
            ),
          ],
        ),
        WhatsPhone(
          phoneNumber: studentModel.phoneNumber,
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
