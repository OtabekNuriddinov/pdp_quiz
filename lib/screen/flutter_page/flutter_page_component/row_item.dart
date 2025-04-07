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

class ModuleSelector extends StatelessWidget {
  final int activeIndex;
  final Function(int) onModuleSelected;

  const ModuleSelector({
    super.key,
    required this.activeIndex,
    required this.onModuleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i <= 5; i++)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => onModuleSelected(i),
                child: CustomRowItem(
                  isActive: activeIndex == i,
                  text: "$i-modul",
                ),
              ),
            ),
        ],
      ),
    );
  }
}

