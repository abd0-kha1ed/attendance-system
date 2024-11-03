import 'package:attendance/constant.dart';
import 'package:attendance/core/utils/assets.dart';
import 'package:attendance/feature/home/presentation/view/widgets/lecture_control_panel_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LectureControlPanelView extends StatelessWidget {
  const LectureControlPanelView({super.key});
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
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Image.asset(Assets.leftArrow),
        ),
      ),
      body: const LectureControlPanelViewBody(),
    );
  }
}


