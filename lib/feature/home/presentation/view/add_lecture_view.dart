import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/home/presentation/view/widgets/add_lecture_view_body.dart';
import 'package:flutter/material.dart';

class AddLectureView extends StatelessWidget {
  const AddLectureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLiftArrow(
            colorIcon: Colors.white, backgroundColor: Colors.black),
        title: const Text(
          'Add New Lecture',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: AddLectureViewBody(),
    );
  }
}
