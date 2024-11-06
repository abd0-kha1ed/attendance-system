import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';

import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_body_widget.dart';
import 'package:flutter/material.dart';

class StudentListViewBody extends StatefulWidget {
  const StudentListViewBody({super.key});

  @override
  State<StudentListViewBody> createState() => _StudentListViewBodyState();
}

class _StudentListViewBodyState extends State<StudentListViewBody> {
  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firebaseServices.getStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final List<AddNewStudentModel> students = [];
            for (var doc in snapshot.data!.docs) {
              if (doc.exists && doc.data() != null) {
                students.add(
                  AddNewStudentModel.fromjson({
                    'name': doc['name'],
                    'code': doc['code'],
                    'phoneNumber': doc['phoneNumber'],
                    'parentPhoneNumber': doc['parentPhoneNumber'],
                    'id': doc.id,
                  }),
                );
              }
            }
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
                  Expanded(
                    child: ListView.builder(
                        itemCount: students.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StudentListViewBodyWidget(
                            studentModel: students[index],
                          );
                        }),
                  ),
                ],
              ),
            );
          } else {
            return const Text('');
          }
        });
  }
}
// comment