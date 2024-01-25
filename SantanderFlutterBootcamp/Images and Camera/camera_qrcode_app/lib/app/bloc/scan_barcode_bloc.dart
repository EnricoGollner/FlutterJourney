import 'dart:async';

import 'package:camera_qrcode_app/app/bloc/scan_barcode_event.dart';
import 'package:camera_qrcode_app/app/bloc/scan_barcode_state.dart';
import 'package:camera_qrcode_app/app/repository/scan_barcode_repository.dart';

class ScanBarcodeBloc {
  final ScanBarcodeRepository _repository = ScanBarcodeRepository();

  final StreamController<ScanBarcodeEvent> _input = StreamController<ScanBarcodeEvent>();
  final StreamController<ScanBarcodeState> _output = StreamController<ScanBarcodeState>();

  Sink<ScanBarcodeEvent> get input => _input.sink;
  Stream<ScanBarcodeState> get stream => _output.stream;

  ScanBarcodeBloc() {
    _input.stream.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(ScanBarcodeEvent event) async {
    await _repository.scanBarcode().then((result) {
      result.fold(
          (failure) => _output.add(ScanBarcodeFailureState(errorMessage: failure.message)),
          (barcode) => _output.add(ScanBarcodeSuccessState(code: barcode.code)));
    });
  }
}