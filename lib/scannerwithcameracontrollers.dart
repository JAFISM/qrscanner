import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:testqrcode/scannedsuccefulpage.dart';

import 'custompaintercontainer.dart';

class CameraControllerWithScanner extends StatefulWidget {
  const CameraControllerWithScanner({super.key});

  @override
  State<CameraControllerWithScanner> createState() =>
      _CameraControllerWithScannerState();
}

class _CameraControllerWithScannerState
    extends State<CameraControllerWithScanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            //overlay: ColoredBox(color: Color(0xff00000)),
            // fit: BoxFit.contain,
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  //Navigator.pushNamed(context, MyHome.routeName);
                  // log('Barcode found/qr code ${barcode.rawValue}');
                  // debugPrint('Barcode found! ${barcode.rawValue}');
                  var result = barcode.rawValue.toString();
                  log('Barcode found! ${result} >>>>>>>>');
                  break;
                }
                // debugPrint('Barcode found! ${barcode.rawValue}');
                // log("Barcode found! ${barcode.rawValue}");
              }
              cameraController.stop();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => SuccesFulPage()),
                  (route) => true);
              // Navigator.pushReplacementNamed(context, SuccesFulPage.routeName);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => SuccesFulPage()));
              //Navigator.of(context).pop();
            },
          ),
          Positioned(
              top: 50,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.08,
                width: MediaQuery.sizeOf(context).width / 1.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffC0C0C0).withOpacity(0.5)),
                child: const Center(
                  child: Text(
                    "Find a code to Scan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  child: CustomPaint(
                    painter: ColoredCornersPainter(),
                  ),
                ),
              )),
          Positioned(
            bottom: 80,
            child: IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flashlight_on_rounded,
                          color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flashlight_on_rounded,
                          color: Colors.white);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          )
        ],
      ),
    );
  }
}
