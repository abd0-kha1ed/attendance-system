
import 'package:attendance/feature/absence_report/presentation/view/widgets/absence_report_item.dart';
import 'package:flutter/material.dart';

class AbsenceReportListView extends StatelessWidget {
  const AbsenceReportListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const AbsenceReportItem();
        },
      ),
    );
  }
}
