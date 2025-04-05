import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String question;
  final String variant;

  const CustomButton(
      {super.key, required this.question, required this.variant});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          "$variant.  $question",
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
