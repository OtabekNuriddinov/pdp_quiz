import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class VerticalItem extends StatelessWidget {
  final String text;
  const VerticalItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.grey50,
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: Icon(Icons.add),
      ),
    );
  }
}
