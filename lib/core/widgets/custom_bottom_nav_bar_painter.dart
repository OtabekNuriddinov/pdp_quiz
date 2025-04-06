import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';

class CustomBottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withAlpha(230)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - AppDimens.bottomNavBarBezierOffset)
      ..quadraticBezierTo(
        size.width,
        size.height + 4,
        size.width,
        size.height - AppDimens.bottomNavBarBezierOffset,
      )
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