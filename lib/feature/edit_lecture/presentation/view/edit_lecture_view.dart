import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/edit_lecture/presentation/view/widgets/edit_lecture_view_body.dart';
import 'package:flutter/material.dart';

class EditLectureView extends StatelessWidget {
  const EditLectureView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
        title: const Text('Edit Lecture'),
        centerTitle: true,
      ),
      body: const EditLectureViewBody(),
    );
  }
}
