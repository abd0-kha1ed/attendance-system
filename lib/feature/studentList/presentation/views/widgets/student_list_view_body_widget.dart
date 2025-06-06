import 'package:attendance/constant.dart';

import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/custom_show_dialog.dart';
import 'package:attendance/core/widgets/whats_phone.dart';
import 'package:attendance/feature/edit_existing_student/presentation/view/edit_existing_student.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';

import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentListViewBodyWidget extends StatelessWidget {
  StudentListViewBodyWidget({
    super.key,
    required this.studentModel, required this.lecture,
  });
  final StudentModel studentModel;
  final LectureModel lecture;

  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: CustomStudentNameId(
                addNewStudentModel: studentModel,
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
                      lectureModel: lecture,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: WhatsPhone(
                phoneNumber: studentModel.phoneNumber,
              ),
            ),
            CustomIconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomShowDialog(
                        onPressed: () async {
                          await firebaseServices
                              .deleteStudent(studentModel.studentId, lecture.id);
                          // ignore: use_build_context_synchronously
                          GoRouter.of(context).pop();
                        },
                      );
                    });
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 35,
                color: Colors.red,
              ),
            )
          ],
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
