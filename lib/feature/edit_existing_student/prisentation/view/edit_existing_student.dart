import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:flutter/material.dart';

class EditExistingStudent extends StatelessWidget {
  const EditExistingStudent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Existing Student',
          style: TextStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
