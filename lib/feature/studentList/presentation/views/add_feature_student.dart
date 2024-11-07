import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/studentList/presentation/views/widgets/add_new_feature_body.dart';
import 'package:flutter/material.dart';

class AddFeatureStudent extends StatelessWidget {
  const AddFeatureStudent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          overflow: TextOverflow.ellipsis,
          'Add New Student',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
      ),
      body: const AddNewFeatureBody(),
    );
  }
}
