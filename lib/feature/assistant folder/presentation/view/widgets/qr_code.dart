import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final GlobalKey qrkey = GlobalKey(debugLabel: "Qr");

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  // Barcode? result;
  // QRViewController? controller;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         Expanded(
  //             flex: 5,
  //             child: QRView(key: qrkey, onQRViewCreated: _onQRViewCreated)),
  //         Expanded(
  //           flex: 1,
  //           child: Center(
  //               child: (result != null)
  //                   ? Text('barcode Data${result!.code}')
  //                   : Text('Scan a code')),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {});
  //   });
}
