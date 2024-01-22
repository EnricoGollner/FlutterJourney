import 'package:camera_qrcode_app/app/core/failure.dart';
import 'package:camera_qrcode_app/app/model/barcode.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBarcodeRepository {
  Future<Either<Failure, BarcodeScanner>> scanBarcode() async {
    try {
      final String barcode = await FlutterBarcodeScanner.scanBarcode('#F06666', 'Cancel', true, ScanMode.BARCODE);

      if (barcode == '-1') {
        return Left(Failure(message: 'Nenhum código de barras foi escaneado.'));
      }

      return Right(BarcodeScanner(code: barcode));
    } on PlatformException {
      return Left(Failure(message: 'Erro ao tentar escanear o código de barras.'));
    } catch (e) {
      return Left(Failure(message: 'Erro: $e'));
    }
  }
}