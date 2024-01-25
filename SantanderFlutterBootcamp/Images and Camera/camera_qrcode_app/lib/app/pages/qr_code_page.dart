import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QRCode');
  Barcode? _result;
  QRViewController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Code'),
        ),
        body: Center(
          child: _result != null
              ? Text(
                  'Barcode type: ${_result!.format.formatName}  |  Data: ${_result!.code}') : const Text('Scan QRCode'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showGeneralDialog(
              barrierLabel: 'QR Code',
              barrierDismissible: true,
              context: context,
              pageBuilder: (_, __, ___) {
                return Scaffold(
                  body: Column(
                    children: [
                      Expanded(
                          flex: 5,
                          child: QRView(
                              key: _qrKey, onQRViewCreated: _onQRViewCreated)),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: (_result != null)
                              ? Text(
                                  'Barcode Type: ${_result!.format.formatName}   Data: ${_result!.code}')
                              : const Text('Scan a code'),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.qr_code),
        ));
  }

  void _onQRViewCreated(QRViewController? controller) {
    _controller = controller;
    controller?.scannedDataStream.listen((scanData) {
      setState(() {
        _result = scanData;
        Navigator.pop(context);
      });
    });
  }
}
