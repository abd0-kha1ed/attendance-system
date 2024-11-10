import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfViewerPage extends StatelessWidget {
  final pw.Document pdfDocument;

  const PdfViewerPage(this.pdfDocument, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PDF Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              // Share the PDF
              await Printing.sharePdf(
                bytes: await pdfDocument.save(),
                filename: 'exported_data.pdf',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () async {
              // Print the PDF
              await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => pdfDocument.save(),
              );
            },
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => pdfDocument.save(),
      ),
    );
  }
}
