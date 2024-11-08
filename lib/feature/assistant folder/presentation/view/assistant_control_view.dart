import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/assistant%20folder/presentation/view/widgets/assistant_control_view_body.dart';
import 'package:flutter/material.dart';

class AssistantControlView extends StatelessWidget {
  const AssistantControlView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Lecture Control Panel',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kLogoColor,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: const AssistantControlViewBody(),
    );
  }
}
