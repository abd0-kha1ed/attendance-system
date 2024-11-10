import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/studentList/data/models/student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/feature_student_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FeaturedStudentsViewBody extends StatefulWidget {
  const FeaturedStudentsViewBody({super.key, required this.lectureModel, });
  final LectureModel lectureModel;
  @override
  State<FeaturedStudentsViewBody> createState() => _StudentListViewBodyState();
}

class _StudentListViewBodyState extends State<FeaturedStudentsViewBody> {
  final FirebaseServices firebaseServices = FirebaseServices();
  List<StudentModel> studentsFeature = [];
  List<StudentModel> filteredStudents = [];
  TextEditingController searchController = TextEditingController();
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  // Debounced search to reduce processing load
  void _onSearchChanged() {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {}); // Trigger rebuild to filter students
    });
  }

  // Filter students based on search query
  List<StudentModel> _getFilteredStudents(List<StudentModel> students) {
    final query = searchController.text.toLowerCase();
    return query.isEmpty
        ? students
        : students
            .where((student) => student.name.toLowerCase().contains(query))
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseServices.getStudentFeature(
          widget.lectureModel.id), // Ensure this is a Firebase real-time stream
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          // Map snapshot data to the students list
          studentsFeature = snapshot.data!.docs.map((doc) {
            return StudentModel.fromJson({
              'name': doc['name'],
              'code': doc['code'],
              'id': doc.id,
            });
          }).toList();

          // Apply filtering directly here
          filteredStudents = _getFilteredStudents(studentsFeature);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomSearchStudentList(
                  controller: searchController,
                ),
                const SizedBox(height: 20),
                if (filteredStudents.isEmpty) const Text('No students found'),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStudents.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FeatureStudentItemWidget(
                        lectureModel: widget.lectureModel,
                        addNewStudentModel: filteredStudents[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }
}
