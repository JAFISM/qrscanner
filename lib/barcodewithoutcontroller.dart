import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:testqrcode/main.dart';
import 'package:testqrcode/scannedsuccefulpage.dart';

class BarcodeScannerWithoutController extends StatefulWidget {
  const BarcodeScannerWithoutController({super.key});

  @override
  State<BarcodeScannerWithoutController> createState() =>
      _BarcodeScannerWithoutControllerState();
}

class _BarcodeScannerWithoutControllerState
    extends State<BarcodeScannerWithoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
        // fit: BoxFit.contain,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            log('Barcode found! ${barcode.rawValue}');
            if (barcode.rawValue != null) {
              var result = barcode.rawValue.toString();
              log(result);
              break;
            }
          }
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => SuccesFulPage()));
        },
      ),
    );
  }
}
