import 'package:flutter/material.dart';

import '../theme/colors.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 1,
          color: AppColors.grey100,
        ),
        SizedBox(width: 2),
        TextButton(
          onPressed: () {},
          child: Text(
            "Or Sign in Width",
            style: TextStyle(
                fontSize: 11,
                color: AppColors.grey100,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 2),
        Container(
          width: 50,
          height: 1,
          color: AppColors.grey100,
        ),
      ],
    );
  }
}
