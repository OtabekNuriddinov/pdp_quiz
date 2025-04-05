import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/text_styles.dart';

import '../../../core/theme/colors.dart';

class MainTextField extends StatelessWidget {
  final String label;
  final String hint;
  const MainTextField({
    required this.label,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          labelText: label,
          labelStyle: AppTextStyles.labelStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.grey100, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey100)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey100, width: 2))),
    );
  }
}
