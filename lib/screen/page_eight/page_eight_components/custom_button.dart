import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';

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
      child: SizedBox(
        height: 54,
        width:335,
        child: MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
