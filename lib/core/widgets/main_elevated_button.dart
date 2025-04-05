import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MainElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onTapped;
  const MainElevatedButton({
    required this.text,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8))),
      onPressed: onTapped,
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.white,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 1),
      ),
    );
  }
}
