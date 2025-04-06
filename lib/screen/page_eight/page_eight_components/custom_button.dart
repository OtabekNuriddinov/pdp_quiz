import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';

import '../../../core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String question;
  final String variant;
  final void Function () onPressed; /// set State qilib keyngi page o'tish uchun

  const CustomButton(
      {super.key, required this.question, required this.variant, required this.onPressed});

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
      child: SizedBox(
        height: AppDimens.d54,
        width: AppDimens.d335,
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.d12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "$variant. ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "$question"),
            ]),
          ),
        ),
      ),
    );
  }
}
