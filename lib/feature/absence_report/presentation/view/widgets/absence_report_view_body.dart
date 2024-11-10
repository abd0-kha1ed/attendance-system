import 'package:attendance/core/utils/pdf_service.dart';
import 'package:attendance/core/widgets/custom_text_filed.dart';
import 'package:attendance/feature/absence_report/presentation/view/widgets/absence_report_list_view.dart';
import 'package:attendance/feature/pdf_export.dart/presentation/views/pdf_view.dart';
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
          const SizedBox(
            height: 10,
          ),
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
                onPressed: () async {
                  // final pdfDocument = await createPdfDocument('Your data here');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PdfViewerPage(pdfDocument),
                  //   ),
                  // );
                },
                child: const Text('Export Data'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const AbsenceReportListView(),
        ],
      ),
    );
  }
}
