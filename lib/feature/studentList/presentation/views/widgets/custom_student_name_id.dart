import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:flutter/material.dart';

class CustomStudentNameId extends StatelessWidget {
  CustomStudentNameId({super.key, required this.addNewStudentModel});
  final AddNewStudentModel addNewStudentModel;
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kAppBarColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                addNewStudentModel.code,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          addNewStudentModel.name,
          // style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
