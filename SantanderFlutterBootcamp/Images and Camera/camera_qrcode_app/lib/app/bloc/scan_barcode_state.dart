abstract class ScanBarcodeState {
  final String? code;

  ScanBarcodeState({this.code});
}

class ScanBarcodeInitial extends ScanBarcodeState {
  ScanBarcodeInitial();
}

class ScanBarcodeSuccessState extends ScanBarcodeState {
  ScanBarcodeSuccessState({required super.code});
}

class ScanBarcodeFailureState extends ScanBarcodeState {
  final String errorMessage;

  ScanBarcodeFailureState({super.code, required this.errorMessage});
}
