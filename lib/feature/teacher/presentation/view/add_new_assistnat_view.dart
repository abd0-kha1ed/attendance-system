import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/teacher/presentation/view/widgets/add_new_assistant_body.dart';
import 'package:flutter/material.dart';

class AddNewAssistnatView extends StatelessWidget {
  const AddNewAssistnatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Add New Assistant',
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
      body: const AddNewAssistantBody(),
    );
  }
}
