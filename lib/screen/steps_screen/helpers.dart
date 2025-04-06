import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///#helper widget for texts
Widget text(String text, double size, FontWeight fontWeight, Color color) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontWeight: fontWeight, fontSize: size, color: color),
  );
}

///#navigationBar
class BottomNavigation extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 10)
      ..quadraticBezierTo(
          size.width, size.height + 4, size.width, size.height - 20)
      ..lineTo(size.width, 0)
      ..close();
    final rect = Rect.fromLTWH(-160, -20, size.width * 1.7, 200);

    canvas.drawArc(rect, pi, pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

///helper for image
Widget buttonBuilder(String url) {
  return Image.asset(
    url,
    width: 41,
    height: 41,
  );
}

///#helper for main buttons
Widget mainButtons(String text1) {
  return Container(
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 181, 51),
        borderRadius: BorderRadius.circular(15)),
    width: 280,
    height: 60,
    child: Center(
      child: Text(
        text1,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
