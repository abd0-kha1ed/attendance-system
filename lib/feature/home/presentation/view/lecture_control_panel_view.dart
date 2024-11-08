import 'package:attendance/constant.dart';
import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/home/data/models/lecture_model.dart';
import 'package:attendance/feature/home/presentation/view/widgets/lecture_control_panel_view_body.dart';
import 'package:flutter/material.dart';

class LectureControlPanelView extends StatelessWidget {
  const LectureControlPanelView({super.key, required this.lectureModel});
  final LectureModel lectureModel;

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
      body:  LectureControlPanelViewBody(lectureModel: lectureModel,),
    );
  }
}
