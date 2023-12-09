import 'package:flutter/material.dart';
import 'package:testqrcode/barcodewithoutcontroller.dart';
import 'package:testqrcode/scannerwithcameracontrollers.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({super.key});
  static const routeName = "/myhome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             const BarcodeListScannerWithController(),
            //       ),
            //     );
            //   },
            //   child: const Text('MobileScanner with List Controller'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CameraControllerWithScanner(),
                  ),
                );
              },
              child: const Text('MobileScanner with Controller'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const BarcodeScannerWithScanWindow(),
            //       ),
            //     );
            //   },
            //   child: const Text('MobileScanner with ScanWindow'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const BarcodeScannerReturningImage(),
            //       ),
            //     );
            //   },
            //   child:
            //       const Text('MobileScanner with Controller (returning image)'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const BarcodeScannerWithoutController(),
                  ),
                );
              },
              child: const Text('MobileScanner without Controller'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const BarcodeScannerWithZoom(),
            //       ),
            //     );
            //   },
            //   child: const Text('MobileScanner with zoom slider'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const BarcodeScannerPageView(),
            //       ),
            //     );
            //   },
            //   child: const Text('MobileScanner pageView'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => BarcodeScannerWithOverlay(),
            //       ),
            //     );
            //   },
            //   child: const Text('MobileScanner with Overlay'),
            // ),
          ],
        ),
      ),
    );
  }
}
