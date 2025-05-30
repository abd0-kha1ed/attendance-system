import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/core/widgets/custom_icon_button.dart';
import 'package:attendance/core/widgets/custom_show_dialog.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_student_name_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureStudentItemWidget extends StatelessWidget {
  FeatureStudentItemWidget({super.key, required this.addNewStudentModel, required this.lectureModel});
  final StudentModel addNewStudentModel;
  final LectureModel lectureModel;
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child:
                  CustomStudentNameId(addNewStudentModel: addNewStudentModel),
            ),
            const Spacer(flex: 1),
            CustomIconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomShowDialog(
                        onPressed: () async {
                          // print(
                          //     "Attempting to delete student with ID: ${addNewStudentModel.studentId}");
                          try {
                            await firebaseServices.deleteFeatureStudent(
                                lectureModel.id ,addNewStudentModel.studentId, );

                            // print(
                            //     "Deletion successful for student ID: ${addNewStudentModel.studentId}");
                            // Close the dialog after deletion
                            // ignore: use_build_context_synchronously
                            GoRouter.of(context).pop();
                            // Add any additional logic here to refresh the data if necessary
                          } catch (e) {
                            // print("Error deleting student: $e");
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Error deleting student: $e')),
                            );
                          }
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
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
