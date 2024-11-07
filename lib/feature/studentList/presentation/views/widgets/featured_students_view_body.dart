import 'package:attendance/core/utils/firebase_services.dart';
import 'package:attendance/feature/studentList/data/models/add_student_model.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/custom_search_student_list.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/feature_student_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FeaturedStudentsViewBody extends StatefulWidget {
  const FeaturedStudentsViewBody({super.key});

  @override
  State<FeaturedStudentsViewBody> createState() => _StudentListViewBodyState();
}

class _StudentListViewBodyState extends State<FeaturedStudentsViewBody> {
  final FirebaseServices firebaseServices = FirebaseServices();
  List<AddNewStudentModel> featuresStudents = [];
  List<AddNewStudentModel> filteredStudents = [];
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
  List<AddNewStudentModel> _getFilteredStudents(
      List<AddNewStudentModel> students) {
    final query = searchController.text.toLowerCase();
    return query.isEmpty
        ? students
        : students
            .where((student) => student.name.toLowerCase().contains(query))
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CustomSearchStudentList(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: StudentListViewWidget()),
        ],
      ),
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
