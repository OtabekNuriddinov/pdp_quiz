import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class CustomRowItem extends StatelessWidget {
  final bool isActive;
  final String text;
  const CustomRowItem({super.key,
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 38,
      decoration: BoxDecoration(
          color: isActive ? AppColors.green : AppColors.grey50,
          borderRadius: BorderRadius.circular(4)
      ),
      alignment: Alignment.center,
      child: Text(text , style: TextStyle(color: isActive? Colors.white : Colors.black, fontSize: 12, fontWeight: FontWeight.w600),),
    );
  }
}
