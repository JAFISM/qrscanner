import 'package:flutter/material.dart';

class SuccesFulPage extends StatefulWidget {
  SuccesFulPage({super.key});

  static const routeName = "/succespage";

  @override
  State<SuccesFulPage> createState() => _SuccesFulPageState();
}

class _SuccesFulPageState extends State<SuccesFulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Text(
            "Scanned Suucesful",
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
