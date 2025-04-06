import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';

import '../../../core/theme/colors.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 10; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  AppRoutes.level,
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.grey50,
                ),
                child: ListTile(
                  title: Text(
                    "$i.Lorem Ipsum dolor sit amet",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(Icons.add),
                ),
              ),
            ),
          ),
      ],
    );
  }
}