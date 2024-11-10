import 'package:attendance/core/widgets/custom_lift_arrow.dart';
import 'package:attendance/feature/absence_report/presentation/view/widgets/absence_report_view_body.dart';
import 'package:flutter/material.dart';

class AbsenceReportView extends StatelessWidget {
  const AbsenceReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff042B59),
        title: const Text(
          'Absence Report',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const CustomLiftArrow(
            colorIcon: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: const AbsenceReportViewBody(),
    );
  }
}
