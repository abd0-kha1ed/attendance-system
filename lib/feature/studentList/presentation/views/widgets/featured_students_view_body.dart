import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';

import 'package:attendance/feature/studentList/presentation/views/widgets/student_list_view_widget.dart';
import 'package:flutter/material.dart';

class FeaturedStudentsViewBody extends StatefulWidget {
  const FeaturedStudentsViewBody({super.key});

  @override
  State<FeaturedStudentsViewBody> createState() =>
      _FeaturedStudentsViewBodyState();
}

class _FeaturedStudentsViewBodyState extends State<FeaturedStudentsViewBody> {
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
            final List<AddNewStudentModel> studentFeature = [];
            for (var doc in snapshot.data!.docs) {
              if (doc.exists && doc.data() != null) {
                studentFeature.add(
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
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // CustomSearchStudentList(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: StudentListViewWidget()),
                ],
              ),
            );
          } else {
            return const Text('');
          }
        });
    // return const Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 10,
    //       ),
    //       CustomSearchStudentList(),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Expanded(child: StudentListViewWidget()),
    //     ],
    //   ),
    // );
  }
}
