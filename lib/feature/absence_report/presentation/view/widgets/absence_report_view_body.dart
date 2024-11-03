import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/absence_report/presentation/view/widgets/absence_report_list_view.dart';
import 'package:flutter/material.dart';

class AbsenceReportViewBody extends StatelessWidget {
  const AbsenceReportViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: CustomTextField(
                  iconButton: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear)),
                  labelText: 'Name',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Export Data'),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const AbsenceReportListView(),
        ],
      ),
    );
  }
}
