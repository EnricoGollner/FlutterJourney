import 'package:camera_qrcode_app/app/bloc/scan_barcode_bloc.dart';
import 'package:camera_qrcode_app/app/bloc/scan_barcode_event.dart';
import 'package:camera_qrcode_app/app/bloc/scan_barcode_state.dart';
import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late final ScanBarcodeBloc _bloc;

  @override
  void initState() {
    _bloc = ScanBarcodeBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.input.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Barcode Scanner'),
      ),
      body: StreamBuilder(stream: _bloc.stream, builder: (context, snapshot) {
        if(snapshot.hasData) {
          if(snapshot.data is ScanBarcodeSuccessState) {
            final state = snapshot.data as ScanBarcodeSuccessState;
            return Center(child: Text(state.code ?? ''));
          } else if(snapshot.data is ScanBarcodeFailureState) {
            final state = snapshot.data as ScanBarcodeFailureState;
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return const Center(child: Icon(Icons.error_sharp, color: Colors.red,));
        }
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () async =>  _bloc.input.add(ScanBarcodeEvent()),
        child: const Icon(Icons.barcode_reader),
      ),
    );
  }
}