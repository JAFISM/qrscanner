import 'package:flutter/material.dart';

class ColoredCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double cornerSize = 50;

    // Top-left corner
    canvas.drawLine(Offset(0, 0), Offset(cornerSize, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, cornerSize), paint);

    // Top-right corner
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - cornerSize, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, cornerSize), paint);

    // Bottom-left corner
    canvas.drawLine(
        Offset(0, size.height), Offset(cornerSize, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - cornerSize), paint);

    // Bottom-right corner
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - cornerSize, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - cornerSize), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
